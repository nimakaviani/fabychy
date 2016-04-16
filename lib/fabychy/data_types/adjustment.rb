module Fabychy
  module DataTypes
    class Adjustment < Fabychy::DataTypes::Base
      attribute :name, String
      attribute :amount, Integer

      def initialize *params
        super(*params)
      end

      def validations
        {
          name: { required: false, class: [String] },
          amount: { required: false, class: [Fixnum] },
        }
      end
    end
  end
end

