class TasksController < ApplicationController
 def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
        redirect_to root_path, notice: '保存出来ました'
    else
        flash.now[:error] = '保存出来ませんでした'
        render :new
    end
 end

  private
  def task_params
    params.require(:task).permit(:eyecatch, :title, :discrption, :deadline)
  end
end