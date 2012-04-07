require 'spec_helper'

describe DecisionTable::Rule do
  Given(:measure) { double(:measure, :foo => "bar", :bing => "baz") }
  
  describe("applies") do
    context "when all values match" do
      Given(:rule) { DecisionTable::Rule.new(measure, {:foo => "bar", :bing => "baz"}, true) }
      Then { rule.applies?.should be_true}
    end
    
    context "when all specified values match" do
      Given(:rule ) { DecisionTable::Rule.new(measure, {:foo => "bar", :bing => ""}, true) }
      Then { rule.applies?.should be_true}
    end
      
    context "when values don't match" do
      Given(:rule) { DecisionTable::Rule.new(measure, {:foo => "not bar", :bing => "baz"}, true) }
      Then { rule.applies?.should be_false}
    end
    
  end
end