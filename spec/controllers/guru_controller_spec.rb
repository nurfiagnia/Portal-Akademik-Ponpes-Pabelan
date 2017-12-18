require 'rails_helper'

RSpec.describe GuruController, type: :controller do
	context 'GET #login' do
		it 'returns success response' do
			get :login
			expect(response).to be_success
		end
	end
end
