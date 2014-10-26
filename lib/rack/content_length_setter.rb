module Rack
  class ContentLengthSetter
    require_relative "content_length_setter/version"
    LENGTH_KEY = "Content-Length"

    def initialize(stack)
      @stack = stack
    end

    def call(previous_state)
      @state = previous_state

      @status, @headers, @body = stack.call(state)

      headers[LENGTH_KEY] = length

      [status, headers, body]
    end

    private def length
      body.size.to_s
    end

    private def stack
      @stack
    end

    private def state
      @state
    end

    private def headers
      @headers
    end

    private def status
      @status
    end

    private def body
      @body
    end
  end
end
