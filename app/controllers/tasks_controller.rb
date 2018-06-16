class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    # @tasks = Task.all
    @task_todo = Task.where(flag: 0)
    @task_done = Task.where(flag: 1)
    @task = Task.new
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task_todo = Task.where(flag: 0)
    @task_done = Task.where(flag: 1)
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "作成しました"
      redirect_to root_url
    else
      # flash[:danger] = "作成できませんでした"
      render :index
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      # format.html { redirect_to tasks_path, notice: 'success : 更新しました' }
      flash[:success] = "更新しました"
      redirect_to '/'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.' 
  end

  # PATCH /tasks/1/toggle_status
  def toggle_status
    @task = Task.find(params[:id])
    if @task.flag == 0
      @task.update_attribute(:flag, 1)
    else
      @task.update_attribute(:flag, 0)
    end
    flash[:success] = "更新しました"
    redirect_to '/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :body, :flag)
    end
    
end
