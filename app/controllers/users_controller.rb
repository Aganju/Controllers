class UsersController < ApplicationController
  def index
    all = User.all
    render json: all
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: new_user
    else
      render json: new_user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end


  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    del_user = User.find(params[:id])
    del_user.destroy
    render json: del_user
  end



  private
  def user_params
    params.require(:user).permit(:user_name)
  end

end
