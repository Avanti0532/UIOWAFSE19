class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.references :course, foreign_key: { to_table: 'courses' }
      t.references :prereq, foreign_key: { to_table: 'courses' }
    end
  end
end
