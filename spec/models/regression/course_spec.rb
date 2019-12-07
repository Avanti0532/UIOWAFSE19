require 'rails_helper'

RSpec.describe Course, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :level }
  it { is_expected.to belong_to :faculty }
  
  it { is_expected.to have_many :enrollments }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :course_name }
  it { is_expected.to have_db_column :level_id }
  it { is_expected.to have_db_column :faculty_id }
  it { is_expected.to have_db_column :applicable_fee }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :time }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :course_name }
  it { is_expected.to validate_presence_of :applicable_fee }
  it { is_expected.to validate_presence_of :level }
  it { is_expected.to validate_presence_of :faculty }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :time }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end