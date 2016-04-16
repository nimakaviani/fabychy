module Fabychy
  module DataTypes
    class Payload < Fabychy::DataTypes::Base
      attribute :template_type, String

      def validations
        {
          template_type: {required: true, class: [String]}
        }
      end
    end
  end
end

