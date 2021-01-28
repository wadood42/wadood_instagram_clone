require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    username: 'monib',
    password: 'monib615'
  )} 

  it "is valid with valid attributes" do 
    expect(subject).to be_valid 
  end
  it "is not valid without username" do
    subject.username = nil
    expect(subject).not_to be_valid 
  end
  it "is not valid without password" do 
    subject.password = nil  
    expect(subject).not_to be_valid 
  end
end
