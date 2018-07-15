class CommentsController < ApplicationController
  def create 
    @comment = Comment.create(comment_params)
    post = Post.find(@comment.post_id)
    if request.format.html?
      if @comment.save
        redirect_to post_url(post), notice: "A comment was added"
      else
        redirect_to post_url(post), notice: "Could not add comment"
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    if request.format.html?
      if @comment.destroy
        redirect_to authors_path, notice: 'Author was destroyed'
      else
        redirect_to authors_path, alert: 'Author could not be destroyed'
      end
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:commenter_name, :content, :post_id)
  end
end
