class Prerequisite < ActiveRecord::Base
  belongs_to :course_name, :class_name => 'Course', :foreign_key => 'course_id'
  belongs_to :prerequisite, :class_name => 'Course', :foreign_key => 'prereq_id'
end