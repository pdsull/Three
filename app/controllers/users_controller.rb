class UsersController < ApplicationController
  
  layout 'nifty'
  before_filter :require_user, :except => [ :new, :create ]
  before_filter :require_no_user, :only => [ :new, :create ]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @family = Family.create
    
    @user2 = User.new
    @user2.family_id = @family.id
    @user2.className = "momEvent"
    @user2.email = params[:user][:second_user_email]
    @user2.password = "god8you"
    @user2.password_confirmation = "god8you"
    @user2.username = params[:user][:second_user_name]
    
    @user = User.new(params[:user])
    @user.family_id = @family.id
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end
