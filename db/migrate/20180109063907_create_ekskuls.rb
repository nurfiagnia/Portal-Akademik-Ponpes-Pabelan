class CreateEkskuls < ActiveRecord::Migration[5.1]
  def change
    create_table :ekskuls do |t|
      t.string :nama
      t.string :nis
      t.string :nama_ekskul
      t.string :nilai
      t.integer :kelas
      t.integer :thn_ajaran

      t.timestamps
    end
  end
end
