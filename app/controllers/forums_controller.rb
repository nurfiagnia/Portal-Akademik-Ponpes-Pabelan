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
  admin = Admin.find_by(username: params[:username])
  guru = Guru.find_by(username: params[:username])
  pengasuhan = Pengasuhan.find_by(username: params[:username])
  santri = Santri.find_by(username: params[:username])
      if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to forums_path      
      elsif guru && guru.authenticate(params[:password])
        session[:guru_id] = guru.id
        redirect_to forums_path 
      elsif pengasuhan && pengasuhan.authenticate(params[:password])
        session[:pengasuhan_id] = pengasuhan.id
        redirect_to forums_path 
      elsif santri && santri.authenticate(params[:password])
        session[:santri_id] = santri.id
        redirect_to forums_path 
      else
        flash.now[:danger] = "Username atau Password salah!"
        render 'login'
      end
end

def logout
  if session[:admin_id] != nil
    session[:admin_id] = nil
    redirect_to forums_path
  elsif session[:guru_id] !=nil
    session[:guru_id] = nil
    redirect_to forums_path
  elsif session[:pengasuhan_id] != nil
    session[:pengasuhan_id] = nil
    redirect_to forums_path
  elsif session[:santri_id] != nil
      session[:santri_id] = nil
      redirect_to forums_path
  else
    render 'index'
  end
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