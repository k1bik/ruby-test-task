require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is not valid with invalid attributes" do
    user = build(:user, phone: 'phone')
    expect(user).to_not be_valid
  end

  it "is not valid without name" do
    user = build(:user, firstName: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without last name" do
    user = build(:user, lastName: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without patronymic" do
    user = build(:user, patronymic: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without phone" do
    user = build(:user, phone: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
end
