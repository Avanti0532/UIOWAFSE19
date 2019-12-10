class Course < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :level
  belongs_to :faculty
  has_many :enrollments
  has_many :syllabuses
  has_many :assignments
  validates :course_name, uniqueness: true,:presence => true
  validates :applicable_fee,:level,:faculty, :description, :time, :presence =>true
end