class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :course
      t.references :student
      t.datetime :registration_datetime
    end
  end
end
