class SantriController < ApplicationController
  def login
  end
  def signin
  	username = params[:username]
  	#password = params[:user_params]
  	respond_to do |format|
  		if params[:password] != "santri" && username != "santri"
        format.html{ render :oops }        
  		else
        @kontak = Kontak.all
        format.html{ render :index #redirect_to @username
        }
  		end
  	end
  end
  def oops
  end
  def index
  end
  #private
   # def user_params
    #  params.require(:username).permit(:username).except(:password)
    #end
end
