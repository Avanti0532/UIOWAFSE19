require 'rails_helper'
require 'spec_helper'

RSpec.describe Student, type: :model do
  it 'valid user' do
    student = Student.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'test12345')
    assert student.valid?
  end

  it 'invalid without email' do
    student = Student.new(first_name: 'John', last_name: 'Doe', password: 'test12345')
    refute student.valid?
  end

  it 'invalid without password' do
    student = Student.new(first_name: 'John', last_name: 'Doe')
    refute student.valid?
  end

  it 'invalid without first name' do
    student = Student.new(last_name: 'Doe', email: 'john@example.com', password: 'test12345')
    refute student.valid?
  end

  it 'invalid without last name' do
    student = Student.new(first_name: 'Doe', email: 'john@example.com', password: 'test12345')
    refute student.valid?
  end
end
