class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
     # normal log in  
    if auth_hash = request.env["omniauth.auth"]
              @user = User.find_or_create_by_omniauth(auth_hash)
              @current_user = @user.name
              session[:user_id] = @user.id
              redirect_to user_path(@user)
            
    else
        @user = User.find_by(:name => params[:user][:name])
          if @user && @user.authenticate(params[:user][:password])
            binding.pry
            session[:user_id] = @user.id

            redirect_to user_path(@user)

          else 
                render 'sessions/login'
          end 

       end 
    end # create 


  def destroy
    session[:user_id] = nil
    reset_session
    render 'sessions/login'
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :user_cash, :password, :user_id)
  end 


  def auth
    request.env['omniauth.auth']
  end

end

#joe blow.... pass: qwert