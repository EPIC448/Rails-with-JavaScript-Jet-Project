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
    
   end
  end

   def show
    if !session.include?(:user_id)
      redirect_to root_path
    else
    @user = User.find(params[:id])
    # render 'users/show'

     #  using Json
     respond_to do |f|
      f.html {render :show}
      f.json {render json:author}
      # render json: @user, status: 200
     end
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
