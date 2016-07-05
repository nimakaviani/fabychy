module Fabychy
  module DataTypes
    class User < Fabychy::DataTypes::Base
      attribute :first_name, String
      attribute :last_name, String
      attribute :profile_pic, String
      attribute :locale, String
      attribute :timezone, String
      attribute :gender, String
    end
  end
end

