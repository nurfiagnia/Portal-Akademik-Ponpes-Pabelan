class CreateNaikKelas < ActiveRecord::Migration[5.1]
  def change
    create_table :naik_kelas do |t|
      t.string :nama
      t.string :nis
      t.integer :kelas
      t.string :tahun_ajaran
      t.string :kenaikan

      t.timestamps
    end
  end
end
