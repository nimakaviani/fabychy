module Fabychy
  module DataTypes
    class MessageBody < Fabychy::DataTypes::Base
      attribute :text, String
      attribute :attachment, Attachment

      def validations
        {
          text: {required: true, class: [String], drop_empty: true, exclusive: true },
          attachment: {required: true, class: [TemplateAttachment, ImageAttachment], drop_empty: true, exclusive: true }
        }
      end
    end
  end
end

