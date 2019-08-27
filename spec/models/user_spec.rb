require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'requires password and password confirmation to create new user' do
      @user = User.new(firstname: 'John', lastname: 'Adams', email: 'addamss@gmail.com', password: 'adamsj', password_confirmation: 'adamsj')
      @user.save
      expect(@user).to be_valid
    end

    it 'requires a unique email when creating a new user' do
      @user = User.new(firstname: 'John', lastname: 'Adams', email: 'adams@gmail.com', password: 'adamsj', password_confirmation: 'adamsj')
      @user.save
      @user2 = User.new(firstname: 'Adam', lastname: 'Johns', email: 'adams@gmail.com', password: 'johnsa', password_confirmation: 'johnsa')
      expect(@user2).to_not be_valid
    end

    it 'requires email, first name, and last name when creating a new user' do
      @user = User.new()
      @user.save
      expect(@user).to_not be_valid
    end

    it 'requires password to have a minimum length of 5 when created' do
      @user = User.new(firstname: 'John', lastname: 'Adams', email: 'adams@gmail.com', password: '2', password_confirmation: '2')
      @user.save
      expect(@user).to_not be_valid
    end
    
  end
  
  describe '.authenticate_with_credentials' do
    it 'returns a valid user if password and email are in the database' do
      @user = User.new(firstname: 'John', lastname: 'Adams', email: 'jigglypuff@gmail.com', password: 'adamsjohn', password_confirmation: 'adamsjohn')
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_a User
    end
  end
end
