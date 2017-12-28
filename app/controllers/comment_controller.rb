class CommentController < ApplicationController
  def create
	@issue = Issue.find(params[:id])
	@comment = @issue.comments.create(params.permit(:username, :body))
	if @comment.save
        redirect_back(fallback_location: forums_path)
	end
  end
end
