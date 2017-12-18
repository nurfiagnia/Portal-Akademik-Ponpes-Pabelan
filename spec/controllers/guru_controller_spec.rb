require 'rails_helper'

RSpec.describe GuruController, type: :controller do
	context 'GET response' do
		it 'returns login response' do
			visit guru_path
		end
		it 'returns index response' do
			guru = Guru.create(username: 'sample', password: 'sample')
			expect(response).to be_success
		end
		it 'returns profil response' do
			get :profil
			expect(response).to be_success
		end
	end
	context 'GET #hapusguru' do
		it 'destroy guru data' do
			admin = Admin.create(username: 'sample', password: 'sample').save
			visit admin_path
			fill_in "Username", :with => "sample"
			fill_in "Password", :with => "sample"
			click_button "Login"
			current_path.should eq(admin_index_path)
			guru = Guru.create(username: 'sample', password: 'sample', pendidikan: 'MA')
			visit admin_guru_path
			click_link "Hapus"
			current_path.should eq(admin_guru_path)
		end
	end
	context 'GET #gurubaru' do
		it 'add guru' do
			admin = Admin.create(username: 'sample', password: 'sample').save
			visit admin_path
			fill_in "Username", :with => "sample"
			fill_in "Password", :with => "sample"
			click_button "Login"
			current_path.should eq(admin_index_path)
			visit admin_guru_path
			click_link "Guru Baru"
			fill_in "Username", :with => "sample"
			fill_in "Password", :with => "sample"
			select('MA', :from => "pendidikan")
			click_button "Simpan"
			click_button "Simpan"
			current_path.should eq(admin_guru_path)
		end
	end
end
