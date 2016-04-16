module Fabychy
  module DataTypes
    class ReceiptElement < Fabychy::DataTypes::Element
      attribute :quantity, Integer
      attribute :price, Integer
      attribute :currency, String

      def validations
        super.merge (
          {
            quantity: {required: false, drop_empty: true, class: [Fixnum] },
            price: {required: false, drop_empty: true, class: [Fixnum] },
            currency: {required: false, drop_empty: true, class: [String] }
          }
        )
      end
    end
  end
end


