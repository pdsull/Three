class JournalController < ApplicationController
  layout 'profi'
  before_filter :require_user
  
  def index
    @entries = current_user.family.entries
  end
  
  def show
    @entry = Entry.find(params[:id])
    @new_note = Note.new
  end
  
  def createnote
    @note = Event.new(params[:note])
    @note.user_id = current_user.id
    if @note.save
      flash[:notice] = "Your note has been saved."
      redirect_to journal_path
    else
      flash[:notice] = "There was an error, please try again."
      redirect_to journal_path
    end
  end
  
end
