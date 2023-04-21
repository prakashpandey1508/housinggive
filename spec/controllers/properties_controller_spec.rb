require 'rails_helper'
RSpec.describe PropertiesController do
    let!(:count) {Property.all.count}

    let(:company){create:company}
    let(:agent) {create:agent,company:company}
    let(:propertytype){create:propertytype}
    let(:property) {create :property,agent:agent,propertytype:propertytype}
    let!(:property1){create :property,agent:agent,propertytype:propertytype}
    describe "index " do
        it 'assigns @properties' do
          get :index
         # expect(assigns(:properties)).to eq([property])
          expect((Property).all.count).to eq(count+1)
    end
    end


    describe "GET #show" do
      it "assigns the requested message to @message" do
        get :show, params: { id: property1.id }
        expect(assigns(:property)).to eq(property1)
      end
    end
  
    describe "POST #create" do 
        before(:each) do
            sign_in(agent)
        end
        context "when account is signed in" do
        it "should creates a property" do
        post :create, params: { property: { name: "incubspace18", address: "chennai", price: 10000, descripition: "dvwwrwwf"} ,agent_id:agent.id,propertytype_id:propertytype.id}
        expect(Property.exists?(property1.id)).to be true

        end
      end
      #rspec invalid - params
      context "with invalid params" do
        it "should not create a new property" do
          expect {
            post :create, params: { property: { name: "", address: "", price: "", descripition: "" }, agent_id:agent.id, propertytype_id:propertytype.id}
          }.not_to change(Property, :count)
        end
      end
    end


    describe "DELETE #destroy" do
        before(:each) do
            sign_in(agent)
        end 
        it "destroys the post" do
            delete :destroy, params: { id: property1.id, property: { name: "absyz", address: "hyderabad", price: 10000, descripition: "vjknjnj" },agent_id: agent.id,propertytype_id:propertytype.id}
            expect(Property.exists?(property1.id)).to be false
        end
    end

    describe "PUT #update" do
    before(:each) do
        sign_in(agent)
    end 
    context "with valid params" do
        it "updates the message" do
        put :update, params: { id: property1.id, property: { name: "Prakash" }, agent_id: agent.id,propertytype_id:propertytype.id}
        property1.reload
        expect(property1.name).to eq "Prakash" 
        end
    end

    context "with invalid params" do
      it "does not update the message" do
      put :update, params: { id: property1.id, property: { name: "" }, agent_id: agent.id }
      property1.reload
      expect(property1.name).not_to eq ""
      end
    end
end

     









end