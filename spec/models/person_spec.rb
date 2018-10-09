require 'rails_helper'

RSpec.describe Person, type: :model do
  fixtures :all

  subject { people(:person_one) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a document_number' do
    subject.document_number = nil
    expect(subject).to_not be_valid
  end
end
