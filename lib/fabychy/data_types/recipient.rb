module Fabychy
  module DataTypes
    class Recipient < Fabychy::DataTypes::Base
      attribute :id, String
      attribute :phone_number, String

      def validations
        {
          id: {required: false, drop_empty: true, class: [String] },
          phone_number: { required: false, drop_empty: true, class: [String] }
        }
      end
    end
  end
end

