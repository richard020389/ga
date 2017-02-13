class UserController < ApplicationController

def index
  @users = User.all
end
def show
  @user = User.find(params[:id])
end
def edit
  @user = User.find(params[:id])
end
def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to :action => :index
end
def new
  @user = User.new
  @user.name = "user"
end
def create
  @user = User.new(user_params)
  if @user.save
    redirect_to :action => :index
  else
    flash.now[:error]=@user.errors.full_messages.join("<br/>").html_safe
    render "new"
  end

end
def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to :action => :show, :id => @user
end


private
  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def user_params
    params.require(:user).permit(:name,:atk,:def,:hp,:ap, :lvl,:exp)
  end
end
