class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :attachment
      t.float :grade
      t.references :course
      t.timestamps null: false
    end
  end
end
