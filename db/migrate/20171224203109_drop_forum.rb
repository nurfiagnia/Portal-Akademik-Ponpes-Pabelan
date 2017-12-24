class DropForum < ActiveRecord::Migration[5.1]
  def change
  	drop_table :forums
  end
end
