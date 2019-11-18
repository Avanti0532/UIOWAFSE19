class Course < ActiveRecord::Base
  belongs_to :level
  belongs_to :faculty
  has_many :registration
  validates :course_name, :presence => true
end