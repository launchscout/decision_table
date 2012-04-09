module DecisionTable
  class Rule
    
    attr_accessor :criteria, :result
    
    def initialize(criteria, result)
      @criteria = criteria
      @result = result
    end
    
    def applies?(candidate)
      criteria.all? do |k, v|
        v.blank? || candidate.send(k) == v
      end
    end
        
  end
end