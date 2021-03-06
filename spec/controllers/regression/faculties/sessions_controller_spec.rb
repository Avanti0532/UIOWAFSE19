require 'rails_helper'

RSpec.describe Faculties::SessionsController, regressor: true, type: :routing do
  # === Routes (REST) ===
  it { should route(:get, '/faculties/sign_in').to('faculties/sessions#new', {}) }
  it { should route(:post, '/faculties/sign_in').to('faculties/sessions#create', {}) } 
  it { should route(:delete, '/faculties/sign_out').to('faculties/sessions#destroy', {}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_signed_out_user) }
  it { should use_before_filter(:allow_params_authentication!) }
  it { should use_before_filter(:require_no_authentication) }
  it { should use_before_filter(:assert_is_devise_resource!) }
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end