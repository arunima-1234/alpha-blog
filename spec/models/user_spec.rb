require 'rails_helper'

describe User, type: :model do
  it 'return all the users' do
    users =User.all
  end

  it 'return specific user' do
    user = User.find_by(id: 8)
  end

  it 'create new user' do
    new_user = User.create!(username: "abc", email: "abc@gmail.com", password: "password123")
  end

  it 'destroy the user' do
    User.create!(username: "abc", email: "abc@gmail.com", password: "password123").destroy
  end
end
