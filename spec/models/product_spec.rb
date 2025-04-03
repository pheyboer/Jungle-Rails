require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name: 'Electronics')
    end

    it 'saves successfully when all fields are set' do
      product = Product.new(
        name: 'Smartphone',
        price: 699.99,
        quantity: 10,
        category: @category
      )
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(
        name: nil,
        price: 699.99,
        quantity: 10,
        category: @category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end


    
  end
end
