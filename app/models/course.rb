class Course < ActiveRecord::Base
  belongs_to :level
  belongs_to :faculty
  has_many :enrollments
  validates :course_name, :presence => true
  validates :applicable_fee,:level,:faculty, :description, :time, :presence =>true
end