require 'rails_helper'

RSpec.describe Enrollment, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :student }
  it { is_expected.to belong_to :course }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :course_id }
  it { is_expected.to have_db_column :student_id }
  it { is_expected.to have_db_column :registration_datetime }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end