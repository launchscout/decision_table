require 'spec_helper'

module DecisionTable
  describe Ruleset do
    Given(:candidate) { double(:candidate, foo: "bar", baz: "bing")}
    describe "decide" do
      context "one applicable rule" do
        Given(:ruleset) do
          rule = Rule.new({foo: "bar"}, "result")
          Ruleset.new([rule])
        end
        Then { ruleset.evaluate(candidate).should == "result" }
      end
      context "two applicable rules" do
        Given(:first_rule) { first_rule = Rule.new({baz: "bing"}, "first_result") }
        Given(:second_rule) { first_rule = Rule.new({foo: "bar"}, "second_result") }
        Given(:ruleset) { Ruleset.new [first_rule, second_rule] }
        Then { ruleset.evaluate(candidate).should == "first_result"}
      end
      context "no applicable rules"
    end
  end
end