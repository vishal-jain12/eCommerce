class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(resource_params)

    resource.save
    render_resource(resource)
  end

  def resource_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end