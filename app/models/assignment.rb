class Assignment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  mount_uploader :sub_attachment, AttachmentUploader
  validates :course, presence: true
  belongs_to :course
end
