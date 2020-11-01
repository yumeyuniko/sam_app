class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end


#POST /users (+ params )
  def create
    # User.create(params[:user])
    @user = User.new(user_params)
    #=> name, email, pass/confirmation
    if @user.save
      #Success (valid params)
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #reidirect_to user_path(@user)
      #reidirect_to user_path(@user.id)
      #reidirect_to user_path(1) => /users/1

    else
      #Failure (not valid parms)
      render 'new'
    end
  end
  


private
 def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
 end
end
