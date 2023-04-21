require 'rails_helper'

RSpec.describe "GET /api/v1/properties", type: :request do
  
  #for all Properties
  describe "GET /api/v1/properties" do

    context "when posts exist" do
      let!(:count) {Property.all.count}
      let!(:company){create(:company)}
      let!(:agent) { create(:agent,company:company) }
      let!(:propertytype){create(:propertytype)}
      let!(:properties) { create_list(:property, 3, agent: agent, propertytype:propertytype) }

      before(:each) do
        get "/api/v1/properties"
      end

      it "returns a successful response" do
        expect(response).to have_http_status(200)
      end
  

      it "returns a JSON response with all messages" do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(count+3)
      
      end

    end

    context "when no properties exist" do

      before(:each) do
        Property.destroy_all
        get "/api/v1/properties"
      end

      it "returns an empty JSON response" do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to be_empty
      end

    end


  end
   
  #
  #for creating a properties through api 
  describe "Propety create" do
    let(:company){create(:company)}
    let(:agent) { create(:agent,company:company) }
    let(:propertytype){create(:propertytype)}
    let(:property){create(:property, agent:agent, propertytype:propertytype)}
    context "with valid attributes" do
      
      it "creates a new properties" do
        expect {
          post '/api/v1/properties',params: { property: { name: "nameghvgyy", address: "rgqerkjgnjerngjer", descripition: "fergqreqsdvsd", price: 962381, agent_id: agent.id, propertytype_id: propertytype.id } }

        }.to change(Property, :count).by(1)
      end

      it "returns a successful response" do
        post "/api/v1/properties", params: { property: { name: "nameghvgyy", address: "rgqerkjgnjerngjer", descripition: "fergqreqsdvsd", price: 962381, agent_id: agent.id, propertytype_id: propertytype.id } }
        expect(response).to have_http_status(:success)
      end  
    end 




    context "with invalid attributes" do
      let(:invalid_attributes) { { property: { name: "", descripition: "nd" } } }
  
      it "does not create a new message" do
        expect {
          post "/api/v1/properties", params: invalid_attributes
        }.to_not change(Property, :count)
      end
  
      it "returns an error message in the response" do 
        post "/api/v1/properties", params: invalid_attributes
        expect(JSON.parse(response.body)["error"]).to_not be_empty
      end
     
    end
  end



  #property update action in api
   
  describe "property update " do
    let(:company){create(:company)}
    let(:agent) { create(:agent,company:company) }
    let(:propertytype){create(:propertytype)}
    let(:property){create(:property, agent:agent, propertytype:propertytype)}
     
    context "with valid params" do
     let(:update_attributes){{name:"prakashpandey"}}
       before(:each) do
          put api_v1_property_path(property.id), params: { property: update_attributes }
       end
    it "returns a successful response" do
         expect(response).to have_http_status(200)
    end

    it "updates the property" do
      expect(property.reload.name).to eq(update_attributes[:name])
    end

  end
   
  context "without the invalid parameters" do
     
     let(:invalid_attributes){ { property: { name: nil, description: nil ,price:nil,address:nil} } }
     before(:each) do
      put api_v1_property_path(property.id),  params: invalid_attributes
    end  
    it "does not update the message" do
      expect(property.reload.name).to_not eq(invalid_attributes[:property])
    end
  end




  context "when the properties does not exist" do
    
    before(:each) do
      put api_v1_property_path(0), params: { property: { name: "NewTitle" } }
    end

    it "returns a 404 response" do
      expect(response).to have_http_status(404)
    end

    it "returns an error message" do
      expect(JSON.parse(response.body)["message"]).to eq("Record not found")
    end
  end
    
  end

  describe "DELETE /api/v1/properties/:id" do
    let(:company){create(:company)}
    let(:agent) { create(:agent,company:company) }
    let(:propertytype){create(:propertytype)}
    let(:property){create(:property, agent:agent, propertytype:propertytype)}
    let(:company){create(:company)}
    let(:agent) { create(:agent,company:company) }
    let(:propertytype){create(:propertytype)}
    let(:property){create(:property, agent:agent, propertytype:propertytype)}
    
     
    it "deletes the property" do
      expect {
        delete api_v1_property_path(property.id)
      }.to change(Property, :count).by(0)
    end

    it "returns a successful response" do
      delete api_v1_property_path(property.id)
      expect(response).to have_http_status(:ok)
    end

    it "returns a 'Deleted' message" do
      delete api_v1_property_path(property.id)
      expect(JSON.parse(response.body)).to eq({ "message" => "Deleted" })
    end
  end
  

end


  

