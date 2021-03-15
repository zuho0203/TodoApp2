class ArticlesController < ApplicationController
  before_action :set_action, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

 def index
    @boards = Board.all
    @task = User.all
 end
 
 def new
    @board = current_user.boards.build
 end

 def create
    @board = current_user.boards.build(board_params)
    if @board.save
        redirect_to root_path, notice: '保存出来ました'
    else
        flash.now[:error] = '保存出来ませんでした'
        render :new
    end
 end

 def show
 end

 def edit
 end

 def update
    if @board.update(board_params)
        redirect_to article_path(@board), notice: '更新出来ました'
    else
        flash.now[:error] = '更新出来ませんでした'
        render :edit
    end
 end

 def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除に成功しました'
 end

 private
 def board_params
    params.require(:board).permit(:name, :description)
 end

 def set_action
    @board = Board.find(params[:id])
 end

end