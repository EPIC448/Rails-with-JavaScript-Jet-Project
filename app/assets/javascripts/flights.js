


$(function () { 
     $('#new_flight').submit(function (event) {
    // prevent form from submitting the default way
    //console.log('New page in the new HTML  data  is working.')

  event.preventDefault()
  
    var values = $(this).serialize()

   let flying = $.post('/flights', values);
    // ..... JSON is in play here. 
         flying.done(function(data){ 
      
          let fly_data = new Flight(data);
          
          let fly_dataHTML = fly_data.formatFlight()
          //  debugger
          $('#new_flight').append(fly_dataHTML)
       });
    });
  });

  

  class Flight{
    constructor(flight){
      
      this.id = flight.id;
      this.inspection = flight.inspection;
      this.fuel_cost = flight.fuel_cost;
      this.destination = flight.destination
    }
      
    formatFlight (){
           return  `
      <h1>flight ID : ${this.id}</h1>;
      <h3>flight pass inspection :${this.inspection}</h3>;
      <h3>flight Fuel_cost :${this.fuel_cost}</h3>;
      <h3>flight Destination :${this.destination}</h3>;
      `
       
    }

  }

  

  
  // http://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/receiving-api-posts 
