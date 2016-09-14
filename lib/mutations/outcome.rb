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
      if self.success?
        { json: self.json, status: self.result[:status] || 200 }
      else
        { json: ({ errors: @errors.symbolic }).merge(self.result), status: self.result[:status] || 400 }
      end
    end
  end
end