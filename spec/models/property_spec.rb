require 'rails_helper'

RSpec.describe Property, type: :model do
 context  'when creating the property' do
    let(:company) {create:company}
    let(:agent) {create:agent,company:company}
    let(:propertytype) {create:propertytype}
    let(:property)  {build:property,agent:agent, propertytype:propertytype}
    let(:property1) {build:property,agent:agent, propertytype:propertytype}
    let(:property2) {build:property,name:nil,agent:agent, propertytype:propertytype}
    let(:property3) {build:property}
    let(:property4) {build:property,agent:agent, descripition:nil, propertytype:propertytype}

    it 'should valid all the attributes' do
        expect(property.valid?).to eq(true)
    end
    it 'should valid name' do
        expect(property2.valid?).to eq(false)
    end
    it 'should not a valid property without an agent' do
        expect(property3.valid?).to eq(false)
    end
    it 'should  at leat 5 word in the description' do
        expect(property4.valid?).to eq(false)
    end
 end
end
