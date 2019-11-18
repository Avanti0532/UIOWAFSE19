class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    id = params[:id]
    @reg = Registration.where(:course_id => id, :student_id => current_student.id)
    @preq = Prerequisite.where(:course_id => id).pluck(:prereq_id)
    @course = Course.find(id)
  end
end