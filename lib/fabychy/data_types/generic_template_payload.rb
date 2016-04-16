module Fabychy
  module DataTypes
    class GenericTemplatePayload < Fabychy::DataTypes::Payload
      attribute :elements, Array[Element]
      def initialize *params
        super(*params)
        @template_type = 'generic'
      end

      def validations
        super.merge(
          {
            elements: {required: true, class: [Array], inner_class: [GenericElement] }
          }
        )
      end
    end
  end
end

