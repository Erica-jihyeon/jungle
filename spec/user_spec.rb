require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # password validation
    it "is not valid if password and password_confirmation are different" do
      @user = User.new({
        first_name: "test",
        last_name: "test",
        email: "test@example.com",
        password: "1234567",
        password_confirmation: "123456"
      })
      expect(@user).to_not be_valid
    end

    it "is not valid if password and password_confirmation fields are not exist" do
      @user = User.new({
        first_name: "test",
        last_name: "test",
        email: "test@example.com"
      })
      expect(@user).to_not be_valid
    end

    it "requires minimum legth of 5 letters of password" do
      @user = User.new({
        first_name: "test",
        last_name: "test",
        email: "test@example.com",
        password: "1234",
        password_confirmation: "1234"
      })
      expect(@user).to_not be_valid
    end


    # email validation
    it "email must be unique" do
      @user1 = User.create({
        first_name: "test",
        last_name: "test",
        email: "test@example.com",
        password: "1234567",
        password_confirmation: "1234567"
      })
      @user2 = User.create({
        first_name: "test",
        last_name: "test",
        email: "TEST@example.com",
        password: "1234567",
        password_confirmation: "1234567"
      })
      expect(@user2).to_not be_valid
    end

    # user required params
    it "should not vaild if Email does not exist" do
      @user = User.new({
        first_name: "test",
        last_name: "test",
        password: "1234567",
        password_confirmation: "1234567"
      })
      expect(@user).to_not be_valid
    end

    it "should not vaild if first name does not exist" do
      @user = User.new({
        last_name: "test",
        email: "test@example.com",
        password: "1234567",
        password_confirmation: "1234567"
      })
      expect(@user).to_not be_valid
    end

    it "should not vaild if last name does not exist" do
      @user = User.new({
        first_name: "test",
        email: "test@example.com",
        password: "1234567",
        password_confirmation: "1234567"
      })
      expect(@user).to_not be_valid
    end
  
  end


  describe '.authenticate_with_credentials' do

    it "should be authenticated with spaces" do
      @user1 = User.create({
        first_name: "test",
        last_name: "test",
        email: "test@example.com",
        password: "1234567",
        password_confirmation: "1234567"
      })
      user = User.authenticate_with_credentials(" test@example.com ", "1234567")
      expect(user).to_not be nil
    end

    it "should be authenticated with spaces" do
      @user1 = User.create({
        first_name: "test",
        last_name: "test",
        email: "eXample@domain.COM",
        password: "1234567",
        password_confirmation: "1234567"
      })
      user = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "1234567")
      expect(user).to_not be nil
    end

  end

end