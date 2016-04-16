module Fabychy
  class Sanitizer

    def self.sanitize(object)
      return object if object.class.name !~ /Fabychy::/
      internal = sanitize_internal(object)
      h = Hash.new
      object.attributes.each do |k, att|
        next unless internal.nil? || internal.key?(k)
        if !att.is_a? Array
          h[k]=sanitize(att)
        else
          h[k]=Array.new
          att.each do |attr|
            h[k] << sanitize(attr)
          end
        end
      end
      return h
    end

    def self.sanitize_internal(object)
      return if !object.methods.include?(:validations)
      # Delete params not accepted by the API
      validated_param = object.to_hash.delete_if do |k, _v|
        !object.validations.key?(k) || (object.validations[k][:drop_empty] && (_v.nil? || (_v.is_a?(Array) && _v.empty?)))
      end

      exclusives = object.validations.select{|k,v| v[:exclusive] }.keys
      valid_exclusives = object.validations.select{|k,v| v[:exclusive] }.keys & validated_param.keys
      if valid_exclusives.size > 1
        fail Fabychy::Errors::ExclusivityError.new(exclusive_elements)
      end
      ignored_exclusive = exclusives - valid_exclusives
      # Check all required params by the action are present
      object.validations.each do |key, _value|
        next if ignored_exclusive.include?(key)
        if _value[:required] && (!validated_param.key?(key) || validated_param[key].nil?)
          fail Fabychy::Errors::MissingParamsError.new(key, object.class.name)
        end

        # Check param types
        unless _value[:class].include?(validated_param[key].class) || (_value[:drop_empty] && validated_param[key].nil?)
          fail Fabychy::Errors::InvalidParamTypeError.new(key, validated_param[key].class, _value[:class])
        end

        if _value[:class] && _value[:class].include?(Array)
          if validated_param[key].empty?
            fail Fabychy::Errors::InvalidParamValueError.new(key, validated_param[key], ["should not be empty"])
          end
          if _value[:inner_class]
            validated_param[key].each do |v|
              unless _value[:inner_class].include?(v.class)
                fail Fabychy::Errors::InvalidParamTypeError.new(key, validated_param[key].class, _value[:inner_class])
              end
            end
          end
        end

        unless _value[:in].nil? || _value[:in].include?(validated_param[key])
          fail Fabychy::Errors::InvalidParamValueError.new(key, validated_param[key], _value[:in])
        end
        validated_param[key] = validated_param[key].to_s if _value[:class] == Fixnum
      end

      return validated_param
    end
  end
end
