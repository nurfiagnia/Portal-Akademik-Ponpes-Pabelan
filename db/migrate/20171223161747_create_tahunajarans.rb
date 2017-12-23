class CreateTahunajarans < ActiveRecord::Migration[5.1]
  def change
    create_table :tahunajarans do |t|
      t.string :tahun

      t.timestamps
    end
  end
end
