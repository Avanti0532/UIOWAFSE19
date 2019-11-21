require 'rails_helper'
require 'spec_helper'

RSpec.describe Faculty, type: :model do
  it 'valid user' do
    faculty = Faculty.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'test12345')
    assert faculty.valid?
  end

  it 'invalid without email' do
    faculty = Faculty.new(first_name: 'John', last_name: 'Doe', password: 'test12345')
    refute faculty.valid?
  end

  it 'invalid without password' do
    faculty = Faculty.new(first_name: 'John', last_name: 'Doe')
    refute faculty.valid?
  end

  it 'invalid without first name' do
    faculty = Faculty.new(last_name: 'Doe', email: 'john@example.com', password: 'test12345')
    refute faculty.valid?
  end

  it 'invalid without last name' do
    faculty = Faculty.new(first_name: 'Doe', email: 'john@example.com', password: 'test12345')
    refute faculty.valid?
  end
end
