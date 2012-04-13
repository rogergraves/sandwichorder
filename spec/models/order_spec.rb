require 'spec_helper'

describe Order do
  it "belongs to a user" do
    user = User.new(email: "somebody@something.com", password: "somepassword")
    user.save
    order = Order.new(user_id: user.id)
    order.save

    order.user.email.should eq "somebody@something.com"
  end
end
