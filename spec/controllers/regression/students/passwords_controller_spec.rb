require 'rails_helper'

RSpec.describe Students::PasswordsController, regressor: true, type: :routing do
  # === Routes (REST) ===
  
  # === Callbacks (Before) ===
  it { should use_before_filter(:require_no_authentication) }
  it { should use_before_filter(:assert_is_devise_resource!) }
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:assert_reset_token_passed) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end