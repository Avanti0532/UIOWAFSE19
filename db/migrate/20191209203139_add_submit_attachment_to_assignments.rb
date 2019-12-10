class AddSubmitAttachmentToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :sub_attachment, :string
    add_column :assignments, :sub_dtime, :datetime
  end
end
