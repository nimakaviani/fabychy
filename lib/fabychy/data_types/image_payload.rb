module Fabychy
  module DataTypes
    class ImagePayload < Fabychy::DataTypes::Payload
      attribute :url, String

      def validations
        {
          url: {required: true, class: [String]}
        }
      end
    end
  end
end

