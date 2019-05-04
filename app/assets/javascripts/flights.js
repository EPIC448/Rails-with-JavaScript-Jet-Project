$(function () {
  console.log('javaScript is loading and working')
  listenForClick()
  listenNewFlightForm()
})

$(document).ready(function listenForClick () {
  $('button#flights-data').on('click', function (event) {
    event.preventDefault()
    getPosts()
  })
 }
)

// //show flight (for just one flight) - could also show the has_many relationship, maybe for passengers
// //new form for either a flight or a passenger

function getPosts () {
  $.ajax({
    url: 'http://localhost:3000/flights',
    method: 'get',
    dataType: 'json'
  }).done(function (data) {
    console.log('the data is: ', data)
    let myflight = new Flight(data[0])
    let myFlightHTML = myflight.flightHTML()
    document.getElementById('ajax-flights').innerHTML = myFlightHTML
  })
}
// read up document Ready for JavaScript.

class Flight {
  constructor (obj) {
    this.id = obj.id
    this.destination = obj.destination
    this.fuel_cost = obj.fuel_cost
    this.flight_departure = obj.flight_departure
    this.flight_rides = obj.flight_rides
  }

  static newFlightForm () {
    return (`
                <strong>New Flight Form</strong>
                <form id="form-attributes">
                   Inspection  <br><input type="checkbox" id="myCheck"><br>              
                   FuelCost    <br><input type='integer'name='fuel_cost'></input><br>
                   Destination  <br><input type='text' name='destination'></input> <br>
                   Flight Departure  <br><input type='text' name='flight_departure'></input><br>
                   Flight Sit  <br><input type='text' name= 'flight_sit'></input><br>
                  
                    <input type='submit' /><br>
                </form>
            `)
  }
}

//  This is for the flight data

Flight.prototype.flightHTML = function () {
  return (`
        <div>
        <h4> Flight_id: <br>${this.id}</h4>
        <h4>Destination:<br>${this.destination}</h4>
        <h4>FuelCost: <br>${this.fuel_cost}</h4>
        <h4>flight_rides: <br>${this.flight_rides}</h4>
          </div>
    `)
}

function listenNewFlightForm () {
  $('button#ajax-new-flight-form').on('click', function (event) {
    event.preventDefault()
    let newFlightForm = Flight.newFlightForm()
    document.querySelector('div#new-flight-form').innerHTML = newFlightForm
  })
}

$(document).ready(function () {
  $('#new_flight').submit(function (event) {
    // prevent form from submitting the default way
    console.log('post data working.')

    event.preventDefault()

    let values = $(this).serialize()

    let flightx = $.post('/flights', values)

    flightx.done(function (data) {
      // TODO: handle response
      var flights = data



      const newFlight = new Flight(flights)
      const htmlToAdd = newFlight.flightHTML

      $('#new-flight-form').html(htmlToAdd)
    })
  })
})
