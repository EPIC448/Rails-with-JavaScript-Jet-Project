class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

 def create
  @user = User.new(user_params)

  if @user.valid?
    @user.save
    session[:user_id] = @user.id  #attempt to log them in.
    
    redirect_to flights_path
   else

    render 'sessions/login' 
    # sign up page
   end
  end

   def show

    if !session.include?(:user_id)
      redirect_to root_path
    else
    @user = User.find(params[:id])
    render 'users/show'
   # list out in the user / show template
    end
  end
  
   private

   def auth
    request.env['omniauth.auth']
    end


  def user_params
    params.require(:user).permit(:name, :user_cash, :password)
  end 


end # class end
