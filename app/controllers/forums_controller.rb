class ForumsController < ApplicationController
  def index
  @comments = Forum.hash_tree
  end

def new
	@comment = Forum.new(parent_id: params[:parent_id])
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