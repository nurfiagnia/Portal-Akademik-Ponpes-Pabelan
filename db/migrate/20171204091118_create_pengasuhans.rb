class CreatePengasuhans < ActiveRecord::Migration[5.1]
  def change
    create_table :pengasuhans do |t|
      t.string :username
      t.string :password_digest
      t.string :nama
      t.string :jk
      t.string :alamat
      t.string :tempat
      t.date :tanggal_lahir
      t.string :tlp

      t.timestamps
    end
  end
end
