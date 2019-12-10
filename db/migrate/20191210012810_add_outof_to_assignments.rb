class AddOutofToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :out_of, :float
  end
end
