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
  
  describe("parsing rule") do
    Given(:rule_string) { "foo:bar,bing:baz" }
    When(:rule) { DecisionTable::Rule.parse(rule_string) }
    Then { rule.applies?(candidate).should be_true }
    
    context "with boolean rules" do
      Given(:candidate) { double(:candidate, foo: true, bar: false) }
      Given(:non_matching) { double(:candidate, foo: nil, bar: true) }
      Given(:rule) {DecisionTable::Rule.parse("foo:true,bar:false") }
      Then { rule.applies?(candidate).should be_true }
      Then { rule.applies?(non_matching).should be_false }
    end
  end
  
end