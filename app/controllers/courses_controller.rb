class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    id = params[:id]
    @course = Course.find(id)
    puts @course.course_name
  end
end