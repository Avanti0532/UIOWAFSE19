class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :course_level
    end
  end
end
