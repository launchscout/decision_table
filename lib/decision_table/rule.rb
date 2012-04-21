module DecisionTable
  class Rule
    
    attr_accessor :criteria, :result
    
    def initialize(criteria, result)
      if criteria.is_a?(Hash)
        @criteria = criteria
        @result = result
      else
        @criteria = {}
        keys = criteria
        values = result
        keys.each_with_index { |key, index| @criteria[key] = values[index] }
        @result = values.last
      end
    end
    
    def applies?(candidate)
      criteria.all? do |k, v|
        v.blank? || matches?(candidate, k, v)
      end
    end
    
    def matches?(candidate, key, value)
      if value.to_s == "true"
        candidate.send(key)
      elsif value.to_s == "false"
        !candidate.send(key)
      else
        candidate.send(key) == value
      end
    end
    
    def self.parse(rule_string)
      criteria = {}
      rule_string.split(",").each do |crit|
        k, v = crit.split(":")
        criteria[k] = v
      end
      Rule.new(criteria, true)
    end
    
  end
end