require 'rails_helper'

RSpec.describe User, type: :model do

  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: '', email: 'test@test.com', password: 'test', password_confirmation: 'test')
    expect(user).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new(name: 'test', email: '', password: 'test', password_confirmation: 'test')
    expect(user).not_to be_valid
  end

  it "passwordが空ならバリデーションが通らない" do
    user = User.new(name: 'test', email: 'test@test.com', password: '', password_confirmation: '')
    expect(user).not_to be_valid
  end

  it "passwordとpassword_confirmationが一致しないならバリデーションが通らない" do
    user = User.new(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'mof')
    expect(user).not_to be_valid
  end

  it "nameとemailとpasswordに内容が記載されていればバリデーションが通る" do
    user = User.new(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
    expect(user).to be_valid
  end

end

