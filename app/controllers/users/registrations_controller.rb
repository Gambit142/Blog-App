class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  prepend_before_action :require_no_authentication, only: [:cancel]
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    render json: { message: 'Something went wrong.' }
  end
end
