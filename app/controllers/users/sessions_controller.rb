class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  prepend_before_action :require_no_authentication, only: [:cancel]
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if current_user
      login_success
    else
      respond_to_on_destroy
    end
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def login_success
    render json: { message: 'You are logged in' }, status: :ok
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  end
end
