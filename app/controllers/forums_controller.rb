class ForumsController < ApplicationController
  def index
  @comments = Forum.hash_tree
  end

def new
	@comment = Forum.new(parent_id: params[:parent_id])
end

def create
  if params[:forum][:parent_id].to_i > 0
    parent = Forum.find_by_id(params[:forum].delete(:parent_id))
    @comment = parent.children.build(comment_params)
  else
    @comment = Forum.new(comment_params)
  end

  if @comment.save
    flash[:success] = 'Your comment was successfully added!'
    redirect_to forums_path
  else
    render 'new'
  end
end

private

  def comment_params
    params.require(:forum).permit(:title, :body, :author)
  end

end