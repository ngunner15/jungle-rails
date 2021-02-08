require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid" do
      user = User.new(
        name: 'name',
        email: 'test2@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end
    
    it "name is missing" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
  
      user.name = 'name' # valid state
      user.valid? 
      expect(user.errors[:name]).not_to include("can't be blank")
    end

    it "email is missing" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
  
      user.email = 'test@test.com' # valid state
      user.valid?
      expect(user.errors[:email]).not_to include("can't be blank")
    end

    it "password don't match" do
      user = User.new(
        name: 'name',
        email: 'test2@test.com',
        password: 'password',
        password_confirmation: 'pass'
      )
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end

    it 'email must be unique' do
      user1 = User.new
      user1.name = 'name'
      user1.email = 'test@test.com'
      user1.password = 'password'
      user1.password_confirmation = 'password'

      user1.save
    
      user2 = User.new
      user2.name = 'name'
      user2.email = 'test@test.com'
      user2.password = 'password'
      user2.password_confirmation = 'password'
      user2.save
    
      expect(user2.errors[:email].first).to eq('has already been taken')
    end

    it 'password length less than 5 characters is invalid' do
      user = User.new
      user.name = 'name'
      user.email = 'test@test.com'
      user.password = '1234'
      user.password_confirmation = '1234'
      expect(user).to be_invalid
    end

    it 'password length with 5 characters is valid' do
      user = User.new
      user.name = 'name'
      user.email = 'test@test.com'
      user.password = '12345'
      user.password_confirmation = '12345'
      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      user = User.new(
        name: 'name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(user).not_to be(nil)
    end

    it 'should not pass with invalid credentials' do
      user = User.new(
        name: 'name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', 'pass')
      expect(user).to be(nil)
    end

    it 'should pass even with spaces present in email' do
      user = User.new(
        name: 'name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('  test@test.com  ', 'password')
      expect(user).not_to be(nil)
    end

    it 'should pass even with caps present in email' do
      user = User.new(
        name: 'name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('tesT@tEst.com', 'password')
      expect(user).not_to be(nil)
    end
  end
end
