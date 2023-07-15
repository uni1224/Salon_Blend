class Salon::CommentsController < ApplicationController
     def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.salon_id = current_salon.id
    @comment.post_id = @post.id
    @comment.save
    flash[:success] = 'コメントしました'
    redirect_to salon_post_path(@post)
     end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    flash[:success] = 'コメントを削除しました'
    redirect_to salon_post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
