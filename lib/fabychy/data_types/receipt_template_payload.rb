module Fabychy
  module DataTypes
    class ReceiptTemplatePayload < Fabychy::DataTypes::Payload
      attribute :recipient_name, String
      attribute :order_number, String
      attribute :currency, String
      attribute :payment_method, String
      attribute :timestamp, String
      attribute :order_url, String
      attribute :elements, String
      attribute :address, Address
      attribute :summary, Summary
      attribute :adjustments, Adjustment

      def initialize *params
        super(*params)
        @template_type = 'receipt'
      end

      def validations
        super.merge(
          {
            recipient_name: {required: true, class: [String] },
            order_number: {required: true, class: [String] },
            currency: {required: true, class: [String] },
            payment_method: {required: true, class: [String] },
            timestamp: {required: false, drop_empty: true, class: [String] },
            order_url: {required: true, class: [String] },
            elements: {required: true, class: [Array], inner_class: [ReceiptElement] },
            address: {required: false, drop_empty: true, class: [Address] },
            summary: {required: true, class: [Summary] },
            adjustments: {required: false, class: [Adjustment] }
          }
        )
      end
    end
  end
end


