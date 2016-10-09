module Mutations
  class ErrorException < ::StandardError
    attr_accessor :errors

    def initialize(errors)
      self.errors = errors
    end

    def to_s
      "#{self.errors.message_list.join('; ')}"
    end
  end

  class FailureException < ::StandardError
    attr_accessor :errors

    def initialize(errors)
      self.errors = errors
    end

    def to_s
      "#{self.errors.message_list.join('; ')}"
    end
  end

  class SuccessException < ::StandardError
  end
end
