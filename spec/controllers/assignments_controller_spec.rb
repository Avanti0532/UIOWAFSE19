require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'should render index template' do
      get :index, {"name"=>"Database Systems"}
      expect(response).to render_template('index')
    end

    it 'should return the all the syllabuses' do
      assignments = [double('assign1'),double('assign2')]
      expect(Assignment).to receive(:all).and_return(assignments)
      get :index, {"name"=>"Database Systems"}
    end
  end

  describe "Create Method" do
    before :each do
      @course_1 = Course.create(course_name: 'Information Visualization')
      @course_2 = Course.create(course_name: 'Database Systems')
      @mock_student = Student.new(id: 1, first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'test12345')
      @mock_student.save
      controller.stub(:current_student).and_return(@mock_student)
      @mock_registration = Enrollment.create(id: 1, course_id: 1, student_id:1, registration_datetime: '2019-12-07 01:54:40')
      @mock_registration_1 = Enrollment.create(id: 2, course_id: 2, student_id:1, registration_datetime: '2019-12-05 01:54:40')
      @assignment = Assignment.create(id:1, grade: 50, course_id: 1)
    end
    it "flash notice on successful upload" do
      expect(Assignment).to receive(:find).with("1").and_return(@assignment)
      expect(@assignment).to receive(:update_attributes).and_return(true)
      post :create, {"id"=>"1", "assignment"=>{"sub_attachment"=>"#<ActionDispatch::Http::UploadedFile:0x00007f160cb41148 @tempfile=#<Tempfile:/tmp/RackMultipart20191209-12122-11f47n6.pdf>"}, "commit"=>"Save"}
      expect(flash[:notice]).to eq('The assignment has been uploaded successfully.')
    end
    it "flash notice on unsuccessful upload" do
      expect(Assignment).to receive(:find).with("1").and_return(@assignment)
      expect(@assignment).to receive(:update_attributes).and_return(false)
      post :create, {"id"=>"1", "assignment"=>{"sub_attachment"=>"#<ActionDispatch::Http::UploadedFile:0x00007f160cb41148 @tempfile=#<Tempfile:/tmp/RackMultipart20191209-12122-11f47n6.pdf>"}, "commit"=>"Save"}
      expect(flash[:notice]).to eq('There is problem in uploading your assignment.')
    end
  end
end
