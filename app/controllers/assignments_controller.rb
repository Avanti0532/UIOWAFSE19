class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    @course_name = params[:name]
  end

  def new
   @assignment = Assignment.new
   @id = params[:id]
  end

  def create
    @assignment = Assignment.find(params[:id])
    @course_name = Course.where(id: @assignment.course_id).pluck('course_name')
    @result = @assignment.update_attributes(sub_attachment: params[:assignment][:sub_attachment], sub_dtime: Time.now)

    if @result
      redirect_to assignments_path(name: @course_name[0]), notice: "The assignment has been uploaded successfully."
    else
      redirect_to assignments_path(name: @course_name[0]), notice: "There is problem in uploading your assignment."
    end
  end
end
