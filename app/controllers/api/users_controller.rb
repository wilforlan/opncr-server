class Api::UsersController < ApplicationController


  def create
    @user = User.new({
      address: create_actor_params[:address],
      role: 'regular',
    })
    @user.save
    render json: @user, status: :created
  end
  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  private
    def create_actor_params
      params.require(:actor).permit(
        :address,
        :name
      )

    end

end
