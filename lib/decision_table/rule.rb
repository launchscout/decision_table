module DecisionTable
  class Rule
    
    attr_accessor :measure, :criteria, :result
    
    def initialize(measure, criteria, result)
      @measure = measure
      @criteria = criteria
      @result = result
    end
    
    def applies?
      criteria.all? do |k, v|
        v.blank? || matches(k, v)
      end
    end
    
    def matches(k, v)
      measure.send(k) == v
    end
    
  end
end