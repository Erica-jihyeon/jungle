require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    describe 'valid' do
      it "valid test" do
        cat1 = Category.new(:name => "Apparel")
        @product = cat1.products.new({
          name: "test",
          description: "test",
          image: "test",
          quantity: 10,
          price: 64.99
        })
        expect(@product).to be_valid
      end
    end

    describe 'name validation' do
      before do
        cat1 = Category.new(:name => "Apparel")
        @product = cat1.products.new({
          name: nil,
          description: "test",
          image: "test",
          quantity: 10,
          price: 64.99
        })
      end

      it "is not valid without a name" do
        expect(@product).to_not be_valid
        expect(["is not a number", "can't be blank"]).to include @product.errors.messages[:name][0]
      end

    end

    describe 'price validation' do
      before do
        cat1 = Category.new(:name => "Apparel")
        @product = cat1.products.new({
          name: "test",
          description: "test",
          image: "test",
          quantity: 10,
          price: nil
        })
      end

      it "is not valid without the price" do
        expect(@product).to_not be_valid
        expect(["is not a number", "can't be blank"]).to include @product.errors.messages[:price][0]
        expect(["is not a number", "can't be blank"]).to include @product.errors.messages[:price][1]
      end

    end

    describe 'quantity validation' do
      before do
        cat1 = Category.new(:name => "Apparel")
        @product = cat1.products.new({
          name: "test",
          description: "test",
          image: "test",
          quantity: nil,
          price: 66.68
        })
      end

      it "is not valid without the quantity" do
        expect(@product).to_not be_valid
        expect(["is not a number", "can't be blank"]).to include @product.errors.messages[:quantity][0]
      end

    end

    describe 'category validation' do
      before do
          @product = Product.new({
          name: "test",
          description: "test",
          image: "test",
          quantity: 20,
          price: 66.68
        })
      end

      it "is not valid without a category" do
        expect(@product).to_not be_valid
        expect(["is not a number", "can't be blank"]).to include @product.errors.messages[:category][0]
      end

    end
    


  end

end