require 'rails_helper'
require 'spec_helper'

RSpec.describe EnrollmentsController, type: :controller do
  describe 'Index method' do
    it 'should render index template' do
      get :index
      expect(response).to render_template('index')
    end
    it 'should return the all the courses' do
      reg = [double('reg1'),double('reg2')]
      expect(Enrollment).to receive(:all).and_return(reg)
      get :index
    end
  end

  describe 'Create method' do
    before :each do
      @course_1 = Course.create(course_name: 'Information Visualization')
      @course_2 = Course.create(course_name: 'Database Systems')
      @mock_student = Student.new(id: 1, first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'test12345')
      @mock_student.save
      controller.stub(:current_student).and_return(@mock_student)
      @mock_registration = Enrollment.new(id: 1, course_id: 1, student_id:1, registration_datetime: '2019-12-07 01:54:40')
      @mock_registration_1 = Enrollment.new(id: 1, course_id: 2, student_id:1, registration_datetime: '2019-12-05 01:54:40')
      @prerequisite = Prerequisite.create(id:1,course_id: 1, prereq_id:2 )
    end
    it 'flash notice on successful registration' do
    Prerequisite.stub_chain(:where,:pluck).and_return(nil)
    expect(Enrollment).to receive(:create_course!).with("1",@mock_student.id).and_return(@mock_registration)
    expect(@mock_registration).to receive(:save).and_return(true)
    post :create, {"param" => "1"}
    expect(flash[:notice]).to eq('You are successfully registered in this course')
    end

    it 'flash notice on unsuccessful registration' do
      Prerequisite.stub_chain(:where,:pluck).and_return(nil)
      expect(Enrollment).to receive(:create_course!).with("1",@mock_student.id).and_return(@mock_registration)
      expect(@mock_registration).to receive(:save).and_return(false)
      post :create, {"param" => "1"}
      expect(flash[:notice]).to eq('Error while registering the course. Please try again later')
    end
    it 'flash notice to complete prerequisite' do
      Prerequisite.stub_chain(:where,:pluck).and_return(@prerequisite)
      Enrollment.stub_chain(:where, :pluck).and_return(nil)
      post :create, {"param" => "1"}
      expect(flash[:notice]).to eq('Please complete prerequisite course before registration')
    end
    it 'flash notice on successful registration when prerequisite is complete' do
      Prerequisite.stub_chain(:where,:pluck).and_return(@prerequisite)
      Enrollment.stub_chain(:where, :pluck).and_return(@mock_registration_1)
      expect(Enrollment).to receive(:create_course!).with("1",@mock_student.id).and_return(@mock_registration)
      expect(@mock_registration).to receive(:save).and_return(true)
      post :create, {"param" => "1"}
      expect(flash[:notice]).to eq('You are successfully registered in this course')
    end

    it 'flash notice on unsuccessful registration when prerequisite is complete' do
      Prerequisite.stub_chain(:where,:pluck).and_return(@prerequisite)
      Enrollment.stub_chain(:where, :pluck).and_return(@mock_registration_1)
      expect(Enrollment).to receive(:create_course!).with("1",@mock_student.id).and_return(@mock_registration)
      expect(@mock_registration).to receive(:save).and_return(false)
      post :create, {"param" => "1"}
      expect(flash[:notice]).to eq('Error while registering the course. Please try again later')
    end
  end
end