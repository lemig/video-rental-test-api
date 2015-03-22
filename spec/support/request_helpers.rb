module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(body)
    end
  end
end