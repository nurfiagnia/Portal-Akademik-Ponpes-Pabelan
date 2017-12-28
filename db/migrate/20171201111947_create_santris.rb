class CreateSantris < ActiveRecord::Migration[5.1]
  def change
    create_table :santris do |t|
      t.string :username
      t.string :password_digest
      t.string :nama
      t.string :nis
      t.string :nisn
      t.string :jk
      t.string :tempat
      t.string :tl
      t.string :agama
      t.string :anak_ke
      t.string :status_keluarga
      t.string :alamat
      t.string :tlp
      t.string :kelas
      t.string :tahun_masuk
      t.string :nama_sekolah
      t.string :alamat_sekolah
      t.string :nama_ayah
      t.string :nama_ibu
      t.string :pekerjaan_ayah
      t.string :pekerjaan_ibu
      t.string :agama_ayah
      t.string :agama_ibu
      t.string :nama_wali
      t.string :agama_wali
      t.string :alamat_wali
      t.string :tlp_wali
      t.string :pekerjaan_wali

      t.timestamps
    end
  end
end