class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.references :level
      t.references :faculty
      t.float :applicable_fee
      t.string :description
      t.string :time
    end
  end
end
