require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it { is_expected.to validate_presence_of :course }
  it { is_expected.to belong_to :course }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :attachment }
  it { is_expected.to have_db_column :grade }
  it { is_expected.to have_db_column :course_id }
  it { is_expected.to have_db_column :due_date }
end
