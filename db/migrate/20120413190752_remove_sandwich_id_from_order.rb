class RemoveSandwichIdFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :sandwich_id
  end
end
