require 'rails_helper'

RSpec.describe User, type: :model do
context 'when creating a user' do
  let(:user) {build :user}
  let(:user1){build :user,name:nil}
  let(:user2){build:user,email:"abcdsysefn"}
  it 'should be valid user with all attrubutes' do
      expect(user.valid?).to eq(true)
  end
  it 'user must have name ' do
    expect(user1.valid?).to eq(false)
  end
 it 'user should have vaild email' do 
   expect(user2.valid?).to eq(false)
 end
  
end
end
