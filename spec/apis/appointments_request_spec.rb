require 'rails_helper'
RSpec.describe "GET /api/v1/appointments", type: :request do

    describe "GET /api/v1/appointments" do

        context "when appointments exist" do
      let!(:count) {Appointment.all.count}
      let!(:user){create(:user)}
      let!(:company){create(:company)}
      let!(:agent) { create(:agent,company:company) }
      let!(:propertytype){create(:propertytype)}
      let!(:property) {create(:property,agent:agent,propertytype:propertytype)}
      let!(:appointment) { create(:appointment, agent: agent, property:property,user:user) }

      before(:each) do
        get "/api/v1/appointments"
      end
      it "returns a successful response" do
        expect(response).to have_http_status(200)
      end
       
      it "returns a JSON response with all messages" do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(count+1)
      
      end

       end


    end
      




end