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
end
