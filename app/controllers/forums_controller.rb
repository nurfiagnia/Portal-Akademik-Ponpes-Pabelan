class ForumsController < ApplicationController
  def index
    @thread = Issue.all
  end

def new
end
def show
  @issue = Issue.find(params[:id])
  #@comments = @issue.comments.includes(:user)
end
def login
  
end
def signin
  user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to forums_path 
      else
        flash.now[:danger] = "Username atau Password salah!"
        render 'login'
      end
end

def logout
    session[:user_id] = nil
    redirect_to forums_path
end
def create
  @issue = Issue.new(issue_params)
  if @issue.save
    flash[:success] = 'Your comment was successfully added!'
    redirect_to forums_path
  else
    render 'new'
  end
end

private

  def issue_params
    params.permit(:title, :author)
  end

end