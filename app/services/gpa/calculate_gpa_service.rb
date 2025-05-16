module Gpa
  class CalculateGpaService
    def initialize(**kwargs)
      @kwargs = kwargs
    end

    def self.call(**kwargs)
      new(**kwargs).call
    end

    def call
      run
    end

    private

    attr_reader :kwargs

    def run
      ((kwargs[:exam] + kwargs[:cch]) / 2).to_i
    end
  end
end
