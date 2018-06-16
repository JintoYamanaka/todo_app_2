class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    # @task_todo = Task.where(flag = '?' and user_id = '?', 0, params[:id])
    # @task_done = Task.where(flag = '?' and user_id = '?', 1, params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to root_url
    else
      # flash[:danger] = "失敗しました"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
