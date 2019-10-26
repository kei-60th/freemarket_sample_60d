class AddGrandParentIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :grand_parent_id, :integer
    add_column :items, :parent_id, :integer
  end
end
