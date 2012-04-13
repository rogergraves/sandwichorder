require 'spec_helper'

describe Sandwich do
  context "create" do
    it "requires a name" do
      sandwich = Sandwich.new
      sandwich.valid?
      sandwich.errors[:name].should_not be_empty
    end
    
    it "name should be unique" do
      sandwich = Sandwich.new(name: "something")
      sandwich.save
      sandwich2 = Sandwich.new(name: "something")
      sandwich2.should_not be_valid
    end
  end
end
