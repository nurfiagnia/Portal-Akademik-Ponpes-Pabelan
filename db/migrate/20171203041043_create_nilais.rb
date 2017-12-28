class CreateNilais < ActiveRecord::Migration[5.1]
  def change
    create_table :nilais do |t|
      t.string :nama
      t.string :nis
      t.string :nisn
      t.string :kelas
      t.integer :thn_ajaran
      t.string :mapel
      t.decimal :kkm
      t.decimal :angka
      t.decimal :praktik
      t.string :huruf

      t.timestamps
    end
  end
end
