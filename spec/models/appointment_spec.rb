require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context 'when creating appointment' do
    let(:user){create:user}
    let(:company){create:company}
    let(:agent){create:agent,company:company}
    let(:propertytype){create:propertytype}
    let(:property){create:property,agent:agent,propertytype:propertytype}
    let(:appointment) { create(:appointment, agent: agent, property: property, user: user) }
    let(:appointment1) {build:appointment,date:nil}
    it 'should be valid with all attributes' do
      expect(appointment.valid?).to eq(true)
    end
      it 'should present valid date' do
        expect(appointment1.valid?).to eq(false)
      end
  end

    
end

