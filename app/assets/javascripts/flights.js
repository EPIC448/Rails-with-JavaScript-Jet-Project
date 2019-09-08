

//   For Submitted Form
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
    constructor(flight) {
      // Study the Class in JavaScript in currilum
      // i seperate the arrguments.
      // this refer to the object that is passed to it.
      this.id = flight.id;
      this.inspection = flight.inspection;
      this.fuel_cost = flight.fuel_cost;
      this.destination = flight.destination
    }
      
    formatFlight (){
           return  `
      <h3>flight ID : ${this.id}</h3>;
      <p>flight pass inspection :${this.inspection}</p>;
      <p>flight Fuel_cost :${this.fuel_cost}</p>;
      <p>flight Destination :${this.destination}</p>;
      `
       
    }

  }

      // >>> Show PAGE JAVASCRIPT<<<
      $(() => {
        bindClickHandlers()
      })
   
const bindClickHandlers = () => {
  $('#flightData').on('click', (e) => {
    e.preventDefault()
    fetch(`/flights.json`)
      .then((res) => res.json())
      .then(flights => {
        $('#flightData').html('')
        flights.forEach(flight => {
         // flight is an object here.
          // declare new varible
          let newFlight = new Flightindex(flight)
          let flightHtml = newFlight.formatFlight()
          $('#flightData').append(flightHtml)
           console.log(newFlight)
          
        })
      })
  })
}

  // Using a JS model Object. I use a conttroctor funciton.s
class Flightindex{
   // id,inspection, destination, fuel_cost, user
     // note: User is an objec of [id and name].
  constructor(flight){
    this.id = flight.id
    this.inspection = flight.inspection
    this.fuel_cost = flight.fuel_cost
    this.destination = flight.destination
    this.user = flight.users
  }
formatFlight(){
    return  `
      <h3>flight ID : ${this.id}</h3>
      <p>flight pass inspection :${this.inspection}</p>
      <p>flight Fuel_cost :${this.fuel_cost}</p>
      <p>flight Destination :${this.destination}</p>
      <br>
      `
  

  }

}
   
// Declare prototype methdos on the posts


  /*
  //  click button for the to display information on javaScript
    >>> This is working already <<
  $(function() {
    $("#js-next").on("click", function (event) {
      event.preventDefault()
      var nextId = parseInt($("#js-next").attr("data-id")) + 1;
  
      $.get("/flights/" + nextId + ".json", function(data){
        // get post
        var flight = data;
debugger
           //$('#js-next').html('')
             flight.users.forEach(function(user){
               console.log(user);
               //debugger
              let newFlight = new Flight_const(user)
              let flightHTML = newFlight.formatIndex()
              $('#js-next').append(flightHTML)
      
        let justName = flight.users.forEach(function(user){
              console.log(user.name);
  
        $(".userName").text(user.name); });
     
        $(".flightInspection").text(flight["inspection"]);
        $(".flightFuel_cost").text(flight["fuel_cost"]);
        $(".flightDestination").text(flight["destination"]);
        $(".flightDeparture").text(flight["flight_sit"]);
        $("#js-next").attr("data-id", flight["id"]);
             }); 
        
      });
      
    });
  })
  >>> This is working already ^^^ <<
    
    */

  //  May need it ot note. 
// function Flight_const(user) {
//      this.id = user.
//    }
  
  

  
  // http://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/receiving-api-posts 
