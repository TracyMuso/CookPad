require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user = User.create(name: 'Test user', email: 'test@mail.com', confirmed_at: Time.now, password: '111111')
    Food.new(
      name: 'Rice',
      measurement_unit: 'grams',
      price: 15.34,
      user: user
    )
  end

  before { subject.save }
  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'price should be greater_than zero' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
end
