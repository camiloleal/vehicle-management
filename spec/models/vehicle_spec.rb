require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  fixtures :all

  subject { vehicles(:vehicle_one) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a plate' do
    subject.plate = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a branch' do
    subject.branch = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category' do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a person_id' do
    subject.person_id = nil
    expect(subject).to_not be_valid
  end
end
