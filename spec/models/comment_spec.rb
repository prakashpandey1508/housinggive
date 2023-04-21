require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user){build:user}
  let(:agent){build:agent}
  let(:property){build:property}
  let(:comment1){build:comment,commentable:agent,user:user}
  let(:comment2){build:comment,commentable:property,user:user,content:nil}
   it 'should be valid with all attributes' do
    expect(comment1.valid?).to eq(true)
   end
   it 'comment must not empty' do
    expect(comment2.valid?).to eq(false)
   end
       
end
