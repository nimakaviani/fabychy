module Fabychy
  module DataTypes
    class Button < Fabychy::DataTypes::Base
      attribute :type, String
      attribute :title, String
      attribute :url, String
      attribute :payload, String

      def initialize *params
        super(*params)
      end

      def validations
        {
          type: { required: true, class: [String], in: ["web_url", "postback"] },
          title: { required: true, class: [String] },
          url: { required: false, drop_empty:true, class: [String], exclusive: true },
          payload: { required: false, drop_empty: true, class: [String], exclusive: true },
        }
      end
    end
  end
end

