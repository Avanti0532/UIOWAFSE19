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
end