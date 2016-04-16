module Fabychy
  module DataTypes
    class Summary < Fabychy::DataTypes::Base
      attribute :subtotal, Integer
      attribute :shipping_cost, Integer
      attribute :total_tax, Integer
      attribute :total_cost, Integer

      def validations
        {
          subtotal: { required: false, class: [Fixnum] },
          shipping_cost: { required: false, class: [Fixnum] },
          total_tax: { required: false, class: [Fixnum] },
          total_cost: { required: true, class: [Fixnum] },
        }
      end
    end
  end
end

