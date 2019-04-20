class FlightsController < ApplicationController


  def index
    @user = User.new
    @flights = Flight.all
    respond_to do |f|
      
      f.html {render :index}
      f.json{render json: @flights}
      #   render json:  @flights, status: 201
    end

  end




   def new
    @flights = Flight.new
    @flights = Flight.create(flight_params)

    if @flights
      
          # @flights = Flight.create(flight_params)
            render json: @flights, status: 200
            
    end
   end

   def create
    @flight = Flight.create(flight_params)
    
    if @flight.save
        @flight = Flight.create(flight_params)       
        # f.json {render  json: @flight}
        f.html{redirect_to flights_path}
        render json: @flight, status: 201

    else
      render 'flights/new'
    end
   
  end

    def edit 
      @flight = Flight.find(params[:id])

      if  @current_user 
      
         redirect_to flight_path
      else
       render 'flights/index'
      end
    end


    


  def update 
    @flight = Flight.find(params[:id])
    @flight.update(flight_params)
    redirect_to flight_path(@flight)
 end

  def commercial
    @flight = Flight.all
   end
    

   def show
    @flights = Flight.create(flight_params)

      if @flights
        
            @flights = Flight.create(flight_params)
              render json: @flights, status: 200
        else
  
         @flight = Flight.find(params[:id])
          respond_to do |f|
            f.html {render :index}
       
           end

      end

  end

 private   
   def flight_params
    params.permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit)
  end 

  # def flights_params
  #   params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit, :user_id)
  # end

end
