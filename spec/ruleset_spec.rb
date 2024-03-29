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
      context "no applicable rules" do
        Given(:rule) { Rule.new({baz: "not bing"}, "first_result") }
        Then { Ruleset.new([rule]).evaluate(candidate).should be_nil }
      end
    end
    
    describe "instantiating from 2d array of strings" do
      Given(:ruleset) { Ruleset.new [["foo", "baz"],["bar", "bing", true]]}
      Then { ruleset.rules.size.should == 1}
      Then { ruleset.evaluate(candidate).should == true }
    end
    
    describe "parsing CSV" do
      pending "maybe later"
      # Given(:csv_data) { File.read(File.join(File.dirname(__FILE__), "rules.csv")) }
      # When(:ruleset) { Ruleset.parse_csv(csv_data) }
      # Then { ruleset.rules.size.should == 2}
    end
  end
end