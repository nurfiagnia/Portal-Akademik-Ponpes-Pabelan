class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
