require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it 'is valid' do
      @category = Category.new(name: 'Soaps')
      @category.save
      @product = Product.new(name: 'Soap', price: 300, quantity: 3)
      @product.category = @category
      expect(@product).to be_valid
    end
    it 'should have a name, price, quantity, and category' do
    end
    it 'should have a name' do
      @category = Category.new
      @product = Product.new
      @product.name = 'Soap'
      expect(@product.name).to be_present
    end
    it 'should have a price' do
      @category = Category.new
      @product = Product.new
      @product.price = 300
      expect(@product.price).to be_present
    end
    it 'should have a quantity' do
      @category = Category.new
      @product = Product.new
      @product.quantity = 3
      expect(@product.quantity).to be_present
    end
    it 'should have a category' do 
      @category = Category.new
      @category.save
      @product = Product.new
      @product.category_id = @category.id
      expect(@product.category_id).to be_present
    end
  end
end
