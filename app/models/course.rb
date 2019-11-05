class Course < ActiveRecord::Base
  belongs_to :level
  belongs_to :faculty
  validates :course_name, :presence => true
end