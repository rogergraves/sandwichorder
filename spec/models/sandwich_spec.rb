require 'spec_helper'

describe Sandwich do
  context "create" do
    it "requires a name" do
      sandwich = Sandwich.new
      sandwich.valid?
      sandwich.errors[:name].should_not be_empty
    end
  end
end
