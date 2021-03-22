class TasksController < ApplicationController
 def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
        redirect_to board_path(board), notice: 'タスクを追加'
    else
        flash.now[:error] = '更新出来ませんでした'
        render :new
    end
  end

  def show
    @task = Task.find(params[:id])
    @board = @task.board
  end

  def edit
    @task = Task.find(params[:id])
    @board = @task.board
  end

  def update
    @task = Task.find(params[:id])
    @board = @task.board
    if @task.update(task_params)
      redirect_to board_path(@board.id), notice: '更新出来ました'
  else
      flash.now[:error] = '更新出来ませんでした'
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    @board = task.board
    task.destroy!
    redirect_to root_path, notice: '削除に成功しました'
 end

  private
  def task_params
    params.require(:task).permit(:eyecatch, :title, :discrption, :deadline)
  end
end