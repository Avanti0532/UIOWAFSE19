require 'rails_helper'

RSpec.describe Students::RegistrationsController, regressor: true, type: :routing do
  # === Routes (REST) ===
  it { should route(:get, '/students/sign_up').to('students/registrations#new', {}) }
  it { should route(:patch, '/students').to('students/registrations#update', {}) } 
  it { should route(:post, '/students').to('students/registrations#create', {}) } 
  it { should route(:delete, '/students').to('students/registrations#destroy', {}) } 
  it { should route(:get, '/students/cancel').to('students/registrations#cancel', {}) }
  it { should route(:get, '/students/edit').to('students/registrations#edit', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_minimum_password_length) }
  it { should use_before_filter(:authenticate_scope!) }
  it { should use_before_filter(:require_no_authentication) }
  it { should use_before_filter(:assert_is_devise_resource!) }
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end