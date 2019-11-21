class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def create
    course_id = params[:param]
    @preq = Prerequisite.where(:course_id => course_id).pluck(:prereq_id)
    if @preq.blank?
      @reg = Enrollment.create_course!(course_id, current_student.id)
      if @reg.save
        flash[:notice] = 'You are successfully registered in this course'
      else
        flash[:notice] = 'Error while registering the course. Please try again later'
      end
    else
      @reg = Enrollment.where(:course_id => @preq).pluck(:course_id)
      if @reg.blank?
        flash[:notice] = 'Please complete prerequisite course before registration'
      else
        @regis = Enrollment.create_course!(course_id, current_student.id)
        if @regis.save
          flash[:notice] = 'You are successfully registered in this course'
        else
          flash[:notice] = 'Error while registering the course. Please try again later'
        end
      end
    end
    redirect_to course_path(course_id)
  end
end