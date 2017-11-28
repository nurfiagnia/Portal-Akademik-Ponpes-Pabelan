class SantriController < ApplicationController
  def login
  end
  def signin
  	username = params[:username]
  	password = params[:password]
  	respond_to do |format|
  		if username != "santri" && password != "santri"
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
end
