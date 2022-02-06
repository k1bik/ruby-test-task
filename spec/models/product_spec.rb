require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    product = create(:product)
    expect(product).to be_valid
  end

  it "is not valid without weight" do
    product = build(:product, weight: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without length" do
    product = build(:product, length: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without width" do
    product = build(:product, width: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without height" do
    product = build(:product, height: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without departure" do
    product = build(:product, departure: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without destination" do
    product = build(:product, destination: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without price" do
    product = build(:product, price: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without distance" do
    product = build(:product, distance: nil)
    expect(product).to_not be_valid
  end
end
