module Fabychy
  module DataTypes
    class Element < Fabychy::DataTypes::Base
      attribute :title, String
      attribute :subtitle, String
      attribute :image_url, String

      def initialize *params
        super(*params)
      end

      def validations
        {
          title: { required: true, class: [String] },
          subtitle: { required: false, class: [String] },
          image_url: { required: false, drop_empty: true, class: [String] },
        }
      end
    end
  end
end

