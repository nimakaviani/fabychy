module Fabychy
  module DataTypes
    class Attachment < Fabychy::DataTypes::Base
      attribute :type, String
      attribute :payload, Payload

      def validations
        {
          type: { required: true, class: [String] } ,
        }
      end
    end
  end
end
