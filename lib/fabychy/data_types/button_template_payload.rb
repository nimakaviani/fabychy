module Fabychy
  module DataTypes
    class ButtonTemplatePayload < Fabychy::DataTypes::Payload
      attribute :text, String
      attribute :buttons, Array[Button]
      def initialize *params
        super(*params)
        @template_type = 'button'
      end

      def validations
        super.merge(
          {
            text: {required: false, drop_empty: true, class: [String] },
            buttons: {required: true, class: [Array], inner_class: [Button] }
          }
        )
      end
    end
  end
end

