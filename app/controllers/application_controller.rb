class ApplicationController < ActionController::API
  before_action :authenticate_request

  attr_reader :current_api_user

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  private
  def authenticate_request
    @current_api_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: "This is not a authorized request." }, status: :unauthorized unless @current_api_user
  end
end
