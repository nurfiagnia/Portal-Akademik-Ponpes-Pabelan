require 'rails_helper'

RSpec.describe Guru, type: :model do
  context "validation tests" do
  	it 'ensures username presence' do
  		guru = Guru.new( password: 'sample', nama: 'sample', nip:'12345', jk: 'Pria', ttl: '1998-09-04', alamat: 'sample', no_tlp: '08999999999', mapel: 'sample', pendidikan: 'MA').save
  		expect(guru).to eq(false)
  	end
  	it 'ensures password presence' do
  		guru = Guru.new( username: 'sample', nama: 'sample', nip:'12345', jk: 'Pria', ttl: '1998-09-04', alamat: 'sample', no_tlp: '08999999999', mapel: 'sample', pendidikan: 'MA').save
  		expect(guru).to eq(false)
  	end
  	it 'should save succesfully' do
  		guru = Guru.new(username: 'sample', password: 'sample', nama: 'sample', nip:'12345', jk: 'Pria', ttl: '1998-09-04', alamat: 'sample', no_tlp: '08999999999', mapel: 'sample', pendidikan: 'MA').save
  		expect(guru).to eq(true)
  	end
  end
end
