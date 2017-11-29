class DropYayasanTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :yayasans
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end