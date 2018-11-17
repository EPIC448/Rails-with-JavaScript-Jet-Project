class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    @user = User.find_by(:id => params[:user][:id])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id

            redirect_to user_path
        else
                render 'sessions/login' 
        end

        #  How i will be using authenticate
        # def create
        #   if auth
        #       @user = User.find_or_create_by(username: auth["info"]["email"]) do |u|
        #         u.password = Password.pronounceable 9
        #       end
      
        #       if @user.save
        #         session[:user_id] = @user.id
        #         redirect_to user_path(current_user)
        #       end
  end

  def destroy
    session[:user_id] = nil
    reset_session
      redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :user_cash, :password, :user_id)
  end 

end
