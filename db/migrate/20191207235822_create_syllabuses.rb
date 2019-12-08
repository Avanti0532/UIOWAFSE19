class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
