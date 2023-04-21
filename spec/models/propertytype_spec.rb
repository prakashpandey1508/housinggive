require 'rails_helper'

RSpec.describe Propertytype, type: :model do
   context 'when validating the property type' do
         let(:propertytype) {build:propertytype}
         it 'it should be the valid property type' do
          expect(propertytype.valid?).to eq(true)
         end
   end
end
