class MembersController < ApplicationController
  
  layout 'nifty'
  
  def index
    @members = Member.all
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = "Successfully created family member."
      @members = Member.all
    else
      render :action => 'new'
    end
  end
  
  def new
    @member = Member.new
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:notice] = "Successfully updated family member."
      redirect_to @member
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "Successfully destroyed family member."
    redirect_to members_path
  end
  
  def show
    @member = Member.find(params[:id])
  end
end
