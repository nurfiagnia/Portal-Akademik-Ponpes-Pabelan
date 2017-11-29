class CreateYayasans < ActiveRecord::Migration[5.1]
  def change
    create_table :yayasans do |t|
      t.string :status
      t.string :nama
      t.string :jabatan

      t.timestamps
    end
  end
end
