class NotesController < ApplicationController

  before_filter :require_user
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(params[:note])
    @note.user_id = current_user.id
    
    if @note.save
      flash[:notice] = "Successfully created note."
      redirect_to @note
    else
      render :action => 'new'
    end
  end
  
end
