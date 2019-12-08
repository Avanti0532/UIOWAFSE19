require 'rails_helper'

RSpec.describe Syllabus, type: :model do
  it { is_expected.to validate_presence_of :course }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to belong_to :course }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :attachment }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :course_id }

end
