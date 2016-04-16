module Fabychy
  module DataTypes
    class ImageAttachment < Fabychy::DataTypes::Attachment
      attribute :payload, ImagePayload

      def initialize *params
        super(*params)
        @type = 'image'
      end

      def validations
        super.merge(
          {
            payload: {required: true, class: [ImagePayload] }
          }
        )
      end
    end
  end
end

