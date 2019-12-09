class AddAttachmentToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :attachment, :string
  end
end
