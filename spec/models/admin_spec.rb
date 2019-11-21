require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin, type: :model do
  it 'valid user' do
    admin = Admin.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'test12345', password_confirmation: 'test12345')
    assert admin.valid?
  end

  it 'invalid without email' do
    admin = Admin.new(first_name: 'John', last_name: 'Doe', password: 'test12345', password_confirmation: 'test12345')
    refute admin.valid?
  end

  it 'invalid without password' do
    admin = Admin.new(first_name: 'John', last_name: 'Doe', password_confirmation: 'test12345')
    refute admin.valid?
  end

  it 'invalid without first name' do
    admin = Admin.new(last_name: 'Doe', email: 'john@example.com', password: 'test12345', password_confirmation: 'test12345')
    refute admin.valid?
  end

  it 'invalid without last name' do
    admin = Admin.new(first_name: 'Doe', email: 'john@example.com', password: 'test12345', password_confirmation: 'test12345')
    refute admin.valid?
  end
end
