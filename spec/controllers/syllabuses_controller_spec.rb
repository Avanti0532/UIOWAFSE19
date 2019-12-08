require 'rails_helper'

RSpec.describe SyllabusesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index,  {"name"=>"Database Systems"}
      expect(response).to have_http_status(:success)
    end

    it 'should render index template' do
      get :index, {"name"=>"Database Systems"}
      expect(response).to render_template('index')
    end

    it 'should return the all the syllabuses' do
      syllabus = [double('syllabus1'),double('syllabus2')]
      expect(Syllabus).to receive(:all).and_return(syllabus)
      get :index, {"name"=>"Database Systems"}
    end
  end
end
