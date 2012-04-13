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
    
    def self.parse_csv(csv)
      data = FasterCSV.parse(csv)
      keys = data.shift
    end
  end
end