require 'rails_helper'
 RSpec.describe AppointmentsController ,type: :controller do
    # let!(:user) { build(:user) }
    # let!(:agent) { build(:agent) }
    # let!(:property) { build(:property) }
    # let(:appointment1) { create(:appointment, agent: agent,property:property,user:user) }



    let(:user){create:user}
    let(:company){create:company}
    let(:agent){create:agent,company:company}
    let(:propertytype){create:propertytype}
    let(:property){create:property,agent:agent,propertytype:propertytype}
    let(:appointment) { create(:appointment, agent: agent, property: property, user: user) }
    let(:appointment1) { create(:appointment, agent: agent, property: property, user: user) }
     
    
    describe 'GET index' do
        it 'assigns @appointments' do
            sign_in(user)
            get :index
           expect(assigns(:appointments)).to eq([appointment])
        end
    end


    describe "GET #show" do
    it "assigns the requested message to @message" do
      get :show, params: { id: appointment1.id }
      expect(assigns(:appointment)).to eq(appointment1)
    end
  end

  describe "appointment #create" do 
  before(:each) do
      sign_in(user)
  end
  context "when user is signed in" do
      it "creates appointment on property" do
      post :create, params: { appointment: { date: nil} ,agent_id:agent.id,user_id:user.id,property_id:property.id}
      expect(Appointment.exists?(appointment1.id)).to be true
      end
  end

  context "with invalid params" do
    it "does not create comment" do
    expect{
        post :create, params: { appointment: { date:nil }, agent_id:agent.id ,user_id:user.id, property_id:property.id }
    }.not_to change(Appointment, :count)
       end
       end
   end
   

    describe "DELETE #destroy" do
    before(:each) do
    sign_in(user)
    end 
    it "destroys the comment" do
    delete :destroy, params: { id: appointment1.id, agent_id: agent.id, user_id: user.id,property_id:property.id }
    expect(Appointment.exists?(appointment1.id)).to be false
    end
end



 end