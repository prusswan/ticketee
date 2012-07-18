class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all(:order => "email")
  end

  def new
    @user = User.new
  end

  def create
    admin = params[:user][:admin] == "1"
    params[:user].delete("admin")
    @user = User.new(params[:user])
    @user.update_attribute("admin", admin)
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
end
