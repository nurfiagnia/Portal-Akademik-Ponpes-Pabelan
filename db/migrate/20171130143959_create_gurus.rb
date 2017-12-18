class CreateGurus < ActiveRecord::Migration[5.1]
  def change
    create_table :gurus do |t|
      t.string :username
      t.string :password_digest
      t.string :nama
      t.string :nip
      t.string :jk
      t.date :ttl
      t.string :alamat
      t.string :no_tlp
      t.string :mapel
      t.string :pendidikan

      t.timestamps
    end
  end
end