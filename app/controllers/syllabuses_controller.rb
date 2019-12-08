class SyllabusesController < ApplicationController
  def index
    @syllabuses = Syllabus.all
    @course_name = params[:name]
  end
end
