class AddTahunAjaranColumnToSantris < ActiveRecord::Migration[5.1]
  def change
    add_column :santris, :tahun_ajaran, :string
  end
end
