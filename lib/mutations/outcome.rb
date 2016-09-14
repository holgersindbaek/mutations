module Mutations
  class Outcome
    attr_reader :result, :errors, :inputs

    def initialize(is_success, result, errors, inputs)
      @success, @result, @errors, @inputs = is_success, result, errors, inputs
    end

    def success?
      @success
    end

    def failure?
      !@success
    end

    def result
      @result.is_a?(Hash) ? @result.symbolize_keys : {}
    end

    def json
      self.result[:json] || {}
    end

    def response
      ap "response 1"
      if self.success?
        ap "response 2"
        ap ({ json: self.json, status: self.result[:status] || 200 })
        { json: self.json, status: self.result[:status] || 200 }
      else
        ap "response 3"
        ap ({ json: ({ errors: @errors.symbolic }).merge(self.result), status: self.result[:status] || 400 })
        { json: ({ errors: @errors.symbolic }).merge(self.result), status: self.result[:status] || 400 }
      end
    end
  end
end