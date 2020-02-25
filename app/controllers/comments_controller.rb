class CommentsController < ApplicationController
  def create
     comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.content
    else
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full_messages
      redirect_back fallback_location: comment.content
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.content, flash: { notice: 'コメントが削除されました'}
  end

  private

  def comment_params
    params.require(:comment).permit(:content_id, :name, :comment)
  end

  
end
