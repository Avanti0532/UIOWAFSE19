class AddCourseToSyllabuses < ActiveRecord::Migration
  def change
    add_reference :syllabuses, :course, foreign_key: true, index: true
  end
end
