class AttachController < ApplicationController
  def create
  	File.first.update(nama: params[:namaa], attachment: params[:attachmenta])
  	File.last.update(nama: params[:namab], attachment: params[:attachmentb])
  end
end
