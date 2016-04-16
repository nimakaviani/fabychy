module Fabychy
  class Notification
    REGULAR = "REGULAR"
    SILENT_PUSH = "SILENT_PUSH"
    NO_PUSH = "NO_PUSH"
  end

  class Message < Fabychy::DataTypes::Base
    attribute :recipient, DataTypes::Recipient
    attribute :message, DataTypes::MessageBody
    attribute :notification_type, String
  end
end

