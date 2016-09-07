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

    def response
      if self.success?
        { json: @result.to_h[:json] || {}, status: @result.to_h[:status] || 200 }
      else
        { json: { errors: @errors.symbolic }, status: @result.to_h[:status] || 400 }
      end
    end
  end
end