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

end
