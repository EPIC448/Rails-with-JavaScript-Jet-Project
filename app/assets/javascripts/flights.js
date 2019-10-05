

      // >>> Index PAGE JAVASCRIPT<<<
   $(() => {
        bindClickHandlers()
      })
   
const bindClickHandlers = () => {
  $('#flightData').on('click', (e) => {
    e.preventDefault()
    // we want url to include flight at the end, thus we attach a History
     history.pushState(null, "null", "flights")
    fetch(`/flights.json`)
      .then((res) => res.json())
      .then(flights => {
        $('#flightData').html('') 
        //  flight Data has HTML in it and we need line 9 to make it emptty, 
        // so we can use it later on in the code. 
        flights.forEach(flight => {
         // flight is an object here. and we iterate over it.
          
          let newFlight = new Flightindex(flight)
          // declare new varible Line 70
          let flightHtml = newFlight.formatIndex()
          $('#flightData').append(flightHtml)
           //console.log(newFlight)
          
        })
      })
  })

  // Adding click event to go to show page from line 96
  // add a click event here. 
  $(document).on('click',".show_link", function(e) {
    e.preventDefault()
    console.log('hello from show link')
    $('#flightData').html('')
    let id = parseInt($(this).attr('data-id'))
     

    fetch(`/flights/${id}.json`)
      .then(res => res.json())
      .then(flight => {
        let newFlight = new Flightindex(flight)
        let flightHtml = newFlight.formatShow()
        $('#flightData').append(flightHtml)
         
    })
  })
}

  // Using a JS model Object. I use a controctor class
// class Flightindex{
  function Flightindex(flight){
   // id,inspection, destination, fuel_cost, user
     // note: User is an objec of [id and name].{
    this.id = flight.id
    this.inspection = flight.inspection
    this.fuel_cost = flight.fuel_cost
    this.destination = flight.destination
    this.user = flight.users
  }


  //we want to be able to use formatIndex on any newly created instance object of Flightindex. 
  // FormatIndex is like a method. And returns flightHTML.
  Flightindex.prototype.formatIndex = function(){
    let flightHtml =  `
  <a href="/flights/${this.id}" data-id="${this.id}" class="show_link"> <h3>flight : ${this.id}</h3></a>
      
      <p>flight pass inspection :${this.inspection}</p>
      <p>flight Fuel_cost :${this.fuel_cost}</p>
      <p>flight Destination :${this.destination}</p>
      <br>
      `
    return flightHtml
 // All working.
  }

     /// For the show page.
  Flightindex.prototype.formatShow = function(){
    let flightHtml =  `
      <h3>flight: ${this.id}</h3>
      
      <p>flight pass inspection:${this.inspection}</p>
      <p>flight Fuel_cost:${this.fuel_cost}</p>
      <p>flight Destination:${this.destination}</p>
      <br>
      `
    return flightHtml
 // All working.
  }
   


   
//   For Submitted Form

$(document).on('submit',"#new_flight", function (event) {
  // prevent form from submitting the default way
  //console.log('New page in the new HTML  data  is working.')

event.preventDefault()

     var values = $(this).serialize() // Grab the Values input in this form.
       // . this is the form itself, thus we can serialize it.
       console.log(values)

 let flying = $.post('/flights', values);
  // we make a post requires to application to create a new flight and 
     // pass in serlize  data which is values.

     flying.done(function (data) { 
        //   use  the .done method to extra out the infromation we 
       // have in out varible (flying) and set up to 
       // Pasts it to the dom.
       $('#new_flight').html('') 
     
       let newFlight = new Flightindex(data)
       let flightHtml = newFlight.formatShow()
            // $('#flightData').append(flightHtml)
       $('#new_flight').html(flightHtml)
     });
  
     event.target.reset()
  });

  
  //May Use event
  //event.stopPropagation
  
  

  
  // http://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/receiving-api-posts 
