class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    # @tasks = Task.all
    @task_todo = Task.where(flag: 0)
    @task_done = Task.where(flag: 1)
    @task = Task.new
  end

  # GET /tasks/1
  # GET /tasks/1.json
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
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        flash[:success] = "作成しました"
        format.html { redirect_to '/' }
      else
        # format.html { render :new }
        flash[:danger] = "作成できませんでした"
        format.html { redirect_to '/'}
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        # format.html { redirect_to tasks_path, notice: 'success : 更新しました' }
        flash[:success] = "更新しました"
        format.html { redirect_to '/'}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  # PATCH /tasks/1/toggle_status
  def toggle_status
    @task = Task.find(params[:id])
    if @task.flag == 0
      @task.update_attribute(:flag, 1)
    else
      @task.update_attribute(:flag, 0)
    end
    # redirect_to tasks_path, notice: 'success : 更新しました'
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
