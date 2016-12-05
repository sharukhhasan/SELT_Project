class UserController < ApplicationController
  def new
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def load_all_users
    @users ||= fetch_all
  end

  def fetch_all
    User.all
  end

  def split_names
    @name = params[:search].split(' ')
  end
  
  def index
    @users = User.paginate(page: params[:page], :per_page => 5).includes(:profile)
  end
  
  def show  
    @image = Image.new
    if params[:id] 
      @user = User.find(params[:id])
      # .includes(:profile)
    else 
      @user = current_user
    end
    @image = Image.where(author_id: @user)
    @followers = current_user.followers
  end
end
