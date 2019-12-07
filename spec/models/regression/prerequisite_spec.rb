require 'rails_helper'

RSpec.describe Prerequisite, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :course_name }
  it { is_expected.to belong_to :prerequisite }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :course_id }
  it { is_expected.to have_db_column :prereq_id }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end