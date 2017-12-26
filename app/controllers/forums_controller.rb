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
        redirect_to forums_login_path, :flash => { :danger => "Username atau password salah!" }
      end
end

def logout
    session[:user_id] = nil
    redirect_to forums_path
end
def create
  @issue = Issue.new(issue_params)
  if @issue.save
      redirect_to forums_path, :flash => { :success => "Berhasil menambakan thread!" }
  else
      redirect_to forums_new_path, :flash => { :danger => "Gagal menambahkan thread!" }
  end
end

private

  def issue_params
    params.permit(:title, :author)
  end

end