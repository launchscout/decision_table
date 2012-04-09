require 'spec_helper'

describe DecisionTable::Rule do
  Given(:candidate) { double(:candidate, :foo => "bar", :bing => "baz") }
  
  describe("applies") do
    context "when all values match" do
      Given(:rule) { DecisionTable::Rule.new({:foo => "bar", :bing => "baz"}, true) }
      Then { rule.applies?(candidate).should be_true}
    end
    
    context "when all specified values match" do
      Given(:rule ) { DecisionTable::Rule.new({:foo => "bar", :bing => ""}, true) }
      Then { rule.applies?(candidate).should be_true}
    end
      
    context "when values don't match" do
      Given(:rule) { DecisionTable::Rule.new({:foo => "not bar", :bing => "baz"}, true) }
      Then { rule.applies?(candidate).should be_false}
    end
    
  end
end