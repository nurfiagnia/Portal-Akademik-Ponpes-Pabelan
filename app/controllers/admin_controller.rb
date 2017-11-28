class AdminController < ApplicationController
  def login
  end
  def signin
  	username = params[:username]
  	password = params[:password]
  	respond_to do |format|
  		if password != "admin" && username != "admin"
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
end