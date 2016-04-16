module Fabychy
  class ApiResponse
    attr_reader :body
    attr_reader :result
    attr_reader :success

    def initialize(response,fail_silently = false)
      if response.status < 500
        @body = response.body
        data = MultiJson.load(@body)
        @success = (response.status == 200)

        if @success
          @result = data
        else
          if !fail_silently
            fail Fabychy::Errors::BadRequestError.new(data['error'], data['message'])
          end
        end
      else
        if !fail_silently
          fail Fabychy::Errors::ServiceUnavailableError.new(response.status)
        end
      end
    end

    def self.parse(request)
      MultiJson.load(request.body)
    end

    alias_method :success?, :success
  end
end

