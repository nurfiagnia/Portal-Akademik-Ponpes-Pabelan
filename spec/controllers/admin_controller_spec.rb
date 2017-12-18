require 'rails_helper'

RSpec.describe AdminController, type: :controller do
	context 'GET #login' do
		it 'returns success response' do
			get :login
			expect(response).to be_success
		end
	end

	context 'GET #guru' do
		it 'returns success response' do
			guru = Guru.create!(username: 'sample', password: 'sample', nama: 'sample', nip:'12345', jk: 'Pria', ttl: '1998-09-04', alamat: 'sample', no_tlp: '08999999999', mapel: 'sample', pendidikan: 'MA')
			get :guru, params: { id: guru.to_param }
		end
	end
	context 'GET #santri' do
		it 'returns success response' do
			santri = Santri.create!(username: 'sample', password: 'sample', nama: 'sample', nis:'12345', nisn: '12345', jk: 'Pria', tempat: 'sample', tl: '1998-09-04', agama: 'sample', anak_ke: '1', status_keluarga: 'kandung', alamat: 'sample', tlp: '08999999999', kelas: '1',
				tahun_masuk: '2017', nama_sekolah: 'sample', alamat_sekolah: 'sample', nama_ayah: 'sample', nama_ibu: 'sample', pekerjaan_ayah: 'sample', pekerjaan_ibu: 'sample', agama_ayah: 'sample', agama_ibu: 'sample', nama_wali: 'sample', agama_wali: 'sample', alamat_wali: 'sample',
				tlp_wali: '08111111111', pekerjaan_wali: 'sample')
			get :santri, params: { id: santri.to_param }
		end
	end

	context 'GET #pengasuhan' do
		it 'returns success response' do
			pengasuhan = Pengasuhan.create!(username: 'sample', password: 'sample', nama: 'sample', jk: 'Pria', alamat: 'sample', tanggal_lahir: '1998-09-04', tlp: '08999999999')
			get :pengasuhan, params: { id: pengasuhan.to_param }
		end
	end

	context 'GET #pengaturan' do
		it 'returns success response' do
			get :pengaturan
			expect(response).to be_success
		end
	end
end
