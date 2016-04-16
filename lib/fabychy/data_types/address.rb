module Fabychy
  module DataTypes
    class Address < Fabychy::DataTypes::Base
      attribute :street_1, String
      attribute :street_2, String
      attribute :city, String
      attribute :postal_code, String
      attribute :state, String
      attribute :country, String

      def initialize *params
        super(*params)
      end

      def validations
        {
          street_1: { required: true, class: [String] },
          street_2: { required: false, drop_empty: true, class: [String] },
          city: { required: true, class: [String] },
          postal_code: { required: true, class: [String] },
          state: { required: true, class: [String] },
          country: { required: true, class: [String] },
        }
      end
    end
  end
end

