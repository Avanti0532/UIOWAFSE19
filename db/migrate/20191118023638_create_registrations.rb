class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :course
      t.references :student
      t.datetime :registration_datetime
    end
  end
end
