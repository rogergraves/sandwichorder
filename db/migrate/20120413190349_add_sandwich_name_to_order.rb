class AddSandwichNameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :sandwich_name, :string

  end
end
