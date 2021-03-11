class ArticlesController < ApplicationController
 def index
    @boards = Board.all
 end
 
 def new
    @board = current_user.boards.build
 end

 def create
    @board = current_user.boards.build(board_params)
    if @board.save
        redirect_to new_article_path(@board), notice: '保存出来ました'
    else
        flash.now[:error] = '保存出来ませんでした'
        render :new
    end
 end

 def show
    @board = Board.find(params[:id])
 end

 def edit
    @board = current_user.boards.find(params[:id])
 end

 def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
        redirect_to article_path(@board), notice: '更新出来ました'
    else
        flash.now[:error] = '更新出来ませんでした'
        render :edit
    end
 end

 private
 def board_params
    params.require(:board).permit(:name, :description)
 end

end