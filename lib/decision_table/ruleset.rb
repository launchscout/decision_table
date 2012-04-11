module DecisionTable
  class Ruleset
    attr_accessor :rules
    def initialize(rules)
      @rules = rules
    end
    
    def evaluate(candidate)
      rule = rules.detect { |rule| rule.applies?(candidate) }
      rule.result if rule
    end
  end
end