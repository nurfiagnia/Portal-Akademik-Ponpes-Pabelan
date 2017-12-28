class CreateKontaks < ActiveRecord::Migration[5.1]
  def change
    create_table :kontaks do |t|
      t.string :email
      t.string :tlp
      t.string :pengasuhan
      t.string :kmi
      t.string :ma
      t.string :sikpb

      t.timestamps
    end
  end
end
