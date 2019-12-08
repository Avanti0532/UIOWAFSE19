class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    @course_name = params[:name]
  end
end
