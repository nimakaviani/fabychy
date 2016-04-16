module Fabychy
  class Bot
    API_ENDPOINT = 'https://graph.facebook.com/v2.6'

    attr_reader :me

    def initialize(token)
      @access_token = token
      @offset = 0
      @timeout = 60
      @fail_silently = false
      @connection = HTTPClient.new
    end

    def send_message(message)
      api_post("me/messages?access_token=#{@access_token}", Fabychy::Sanitizer.sanitize(message))
    end

    def get_user(user_id)
      response = api_get("#{user_id}?fields=first_name,last_name,profile_pic&access_token=#{@access_token}")
      Fabychy::DataTypes::User.new(response.result)
    end

  private


    def api_get(action)
      api_uri = "#{action}"
      begin
        response = @connection.get(
          "#{API_ENDPOINT}/#{api_uri}",
          nil
        )

        ApiResponse.new(response,@fail_silently)
      rescue HTTPClient::ReceiveTimeoutError => e
        if !@fail_silently
          fail Fabychy::Errors::TimeoutError, e.to_s
        end
      end
    end

    def api_post(action, params)
      api_uri = "#{action}"

      begin
        response = @connection.post(
          "#{API_ENDPOINT}/#{api_uri}",
          MultiJson.dump(params),
          'Content-Type' => 'application/json'
        )

        ApiResponse.new(response,@fail_silently)
      rescue HTTPClient::ReceiveTimeoutError => e
        if !@fail_silently
          fail Fabychy::Errors::TimeoutError, e.to_s
        end
      end
    end

  end
end
