class AddParentIdToForums < ActiveRecord::Migration[5.1]
  def change
    add_column :forums, :parent_id, :integer
  end
end
