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


    
  end
end
