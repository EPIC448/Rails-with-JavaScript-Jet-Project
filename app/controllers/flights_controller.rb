class FlightsController < ApplicationController

  before_action :set_flight, only: [:show, :edit, :update]

  def index
    @flights = Flight.all
    

  end

   def new
    
    @flight = Flight.new

    # @flights = current_user.flight.build(flight_params)

    if @flights 
           @flights = Flight.create(flight_params)
            render json: @flights, status: 200  
    end
     
   end

   def create
    # @flight = Flight.create(params[:flight_params])
    @flight = Flight.create(flight_params)
    # @flight_rides
    @flight.valid?
           puts @flight.errors.full_messages    


    if @flight
         respond_to do |f|
        f.json {render  json: @flight}
        f.html{redirect_to flight_path}
        # f.html { render :edit }

        # render json: @flight, status: 201
        end
    else
      render 'flights/new'
    end
   
  end

    def edit 
      @flight = Flight.find(params[:id])

      if  @current_user 
      
         redirect_to flight_path(@flight)
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
    
# We dont want it to return to show. Check out "Returning String Data". IN course.

   def show

    @flight = Flight.find(params[:id])
    respond_to do |format|

      format.html { render :show }
      format.json { render json: @flight}
    end
  

  end


  def flight_data
    post = Flight.find(params[:id])
    #render json: PostSerializer.serialize(post)
    render json: flight.to_json(only: [:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit],
                              include: [users: { only: [:name]}])
  end

 private   
   def flight_params
    params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit)
  end 

  def set_flight
    @flight = Flight.find(params[:id])
  end

end
