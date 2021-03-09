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
        # raise StandardError
        redirect_to new_article_path(@board)
    else
        render :new
    end
 end

 private
 def board_params
    params.require(:board).permit(:name, :description)
 end

end