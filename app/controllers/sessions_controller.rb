class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

     # normal log in
        @user = User.find_by(:id => params[:user][:id])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id

            redirect_to user_path

        else

            if auth_hash = request.env["omniauth.auth"]
                @user = User.find_or_create_by_omniauth(auth_hash)
                session[:user_id] = @user.id
                redirect_to root_path
            else
                render 'sessions/login'
            end 
         end # end of regular user login and out.
   end # create 

  def destroy
    session[:user_id] = nil
    reset_session
      redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :user_cash, :password, :user_id)
  end 


  def auth
    request.env['omniauth.auth']
  end

end
