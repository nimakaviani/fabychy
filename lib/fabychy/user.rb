
require 'httpclient'
require 'virtus'
require 'multi_json'

require 'fabychy/version'
require 'fabychy/data_types/base'

require 'fabychy/data_types/payload'
require 'fabychy/data_types/element'
require 'fabychy/data_types/button'

require 'fabychy/data_types/receipt_element'
require 'fabychy/data_types/generic_element'

require 'fabychy/data_types/address'
require 'fabychy/data_types/adjustment'
require 'fabychy/data_types/summary'
require 'fabychy/data_types/attachment'

require 'fabychy/data_types/generic_template_payload'
require 'fabychy/data_types/button_template_payload'
require 'fabychy/data_types/receipt_template_payload'
require 'fabychy/data_types/image_payload'

require 'fabychy/data_types/image_attachment'
require 'fabychy/data_types/template_attachment'

require 'fabychy/data_types/recipient'
require 'fabychy/data_types/message_body'
require 'fabychy/data_types/user'

require 'fabychy/message'
require 'fabychy/bot'
require 'fabychy/api_response'

module Fabychy
  module Errors
    # Error returned when a required param is missing
    class MissingParamsError < StandardError
      def initialize(parameter, action)
        super("Missing parameter `#{parameter}` for `#{action}`")
      end
    end

    # Error returned when a param type is invalid
    class InvalidParamTypeError < StandardError
      def initialize(parameter, current_type, allowed_types)
        super("Invalid parameter type: `#{parameter}`: `#{current_type}`. Allowed types: #{allowed_types.each { |type| type.class.to_s }.join(',')}.")
      end
    end

    # Error returned when something goes bad with your request to the fabychy API
    class BadRequestError < StandardError
      def initialize(error_code, message)
        super("Bad request. Error code: `#{error_code}` - Message: `#{message}`")
      end
    end

    # Error returned when fabychy API Service is unavailable
    class ServiceUnavailableError < StandardError
      def initialize(status_code)
        super("fabychy API Service unavailable (HTTP error code #{status_code})")
      end
    end

    # Error returned when HTTPClient raise a timeout (?)
    class TimeoutError < StandardError
      def initialize(message)
        super("Timeout reached. Message: #{message}")
      end
    end
  end
end
