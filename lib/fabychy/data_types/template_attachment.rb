module Fabychy
  module DataTypes
    class TemplateAttachment < Fabychy::DataTypes::Attachment
      attribute :payload, Payload

      def initialize *params
        super(*params)
        @type = 'template'
      end

      def validations
        super.merge(
          {
            payload: {required: true, class: [GenericTemplatePayload, ReceiptTemplatePayload, ButtonTemplatePayload] }
          }
        )
      end
    end
  end
end

