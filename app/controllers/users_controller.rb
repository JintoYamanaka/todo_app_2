class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks  #ユーザーと紐づけられたタスク
    @task_todo = Task.where("flag = ? and user_id = ?", 0, params[:id])  
    # @task_todo = @tasks.where(flag:0)  #上に同義
    @task_done = Task.where("flag = ? and user_id = ?", 1, params[:id]) 
    # @task_done = @tasks.where(flag: 1)  #上に同義
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      log_in(@user)
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
