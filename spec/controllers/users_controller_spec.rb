require 'rails_helper'
RSpec.describe UsersController,type: :controller do
    describe 'GET index' do
        let(:user) {create :user}
        it 'assigns @users' do
            sign_in(user)
            get :index
           expect(assigns(:users)).to eq([user])
        end
    end

    
end