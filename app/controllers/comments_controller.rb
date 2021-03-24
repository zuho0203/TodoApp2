class CommentsController < ApplicationController
    def new
        @board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        @board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to board_task_path(@board.id, @comment.task), notice: 'コメントを追加'
        else
            flash.now[:error] = '更新出来ませんでした'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end