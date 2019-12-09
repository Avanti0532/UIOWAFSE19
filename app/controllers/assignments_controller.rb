class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    @course_name = params[:name]
  end

  def new
   @assignment = Assignment.new
  end
end
