Decision Table
==============

decision_table is a gem to build parse and evaluate simple rules than can be expressed as a table.  We've 
extracted this gem from real world projects and hope it can be useful for others.  A simple example is probably the
best way to show what it's all about

Let's say you're building a system to recommend home improvements to homeowners.  For each recommendation, the product 
owner has a table that expresses how to decide if a recommendation applies or not.  Here's the example rule to 
determine if we need to recommend replacing insulation in the attic:

| is_well_insulated?  | attic_accessible? | recommended     |
| true                |                   | false           |
| false               | true              | true            |
| false               | flase             | false           |

decision_table will interpret table such as this expressed as a 2D array or CSV and produce a DecisionTable::Ruleset.  
A ruleset, when given a domain object that implements insulation_r_value and attr_accessible? methods, will return the 
result of the first applicable rule, applicable being defined as a match for all non-blank colums.

For cases where you only have a single applicable rule, you can express it as string like so:

    drinks_coffee?:false,writes_ruby?:true,number_of_children:2
    











