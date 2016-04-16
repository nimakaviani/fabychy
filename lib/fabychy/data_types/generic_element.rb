module Fabychy
  module DataTypes
    class GenericElement < Fabychy::DataTypes::Element
      attribute :item_url, String
      attribute :buttons, Array[Fabychy::DataTypes::Button], :default => nil

      def initialize *params
        super(*params)
      end

      def validations
        super.merge(
          {
            item_url: { required: false, drop_empty: true, class: [String] },
            buttons: { required: false, drop_empty: true, class: [Array], inner_class: [Fabychy::DataTypes::Button] },
          }
        )
      end
    end
  end
end

