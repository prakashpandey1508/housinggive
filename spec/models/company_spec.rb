require 'rails_helper'

RSpec.describe Company, type: :model do
context 'when creating the company' do
  let(:company) {build :company}
  it 'should be valid user with all attrubutes' do
      expect(company.valid?).to eq(true)
  end
  

end
end
