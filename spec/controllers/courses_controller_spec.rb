require 'rails_helper'
require 'spec_helper'

RSpec.describe CoursesController, type: :controller do

  describe 'Index method' do
    it 'should render index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should return the all the courses' do
      course = [double('course1'),double('course2')]
      expect(Course).to receive(:all).and_return(course)
      get :index
    end
  end

  describe 'Show method' do
    before :each do
      prequisite = double('preq1')
      registration = [double('registration1'),double('registration2')]
      mock_student = Student.new(id: 2, first_name: 'Lily',last_name: 'James',email: 'lily532@gmail.com', password: '1234567')
      @course = Course.create(:id=>1, :course_name => 'Database')
      controller.stub(:current_student).and_return(mock_student)
      expect(Enrollment).to receive(:where).with(:course_id => "1",:student_id => mock_student.id).and_return(registration)
      Prerequisite.stub_chain(:where, :pluck).and_return(prequisite)

    end
    it 'should return course information' do
      expect(Course).to receive(:find).with('1').and_return(@course)
      get :show, {:id => '1'}
    end
    it 'should render show template' do
      expect(Course).to receive(:find).with('1').and_return(@course)
      get :show,  {"id"=>"1"}
      expect(response).to render_template('show')
    end
  end

end
