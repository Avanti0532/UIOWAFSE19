class Enrollment < ActiveRecord::Base
   belongs_to :student
   belongs_to :course
  def self.create_course!(course_id,student_id)
    @reg = Enrollment::create(course_id: course_id, student_id: student_id, registration_datetime: Time.now)
  end
end