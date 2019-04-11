$(document).ready(function () {
  console.log('javaScript is loading and working')
  listenForClick()
  listenNewFlightForm()
})

function listenForClick () {
  $('button#flights-data').on('click', function (event) {
    event.preventDefault()
    getPosts()
  })
}

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

class Flight {
  constructor (obj) {
    this.id = obj.id
    this.destination = obj.destination
    this.fuel_cost = obj.fuel_cost

    this.flight_departure = obj.flight_departure
  }

  static newFlightForm () {
    return (`
                <strong>New Flight Form</strong>
                <form>
                   Inspection <input type="checkbox" id="myCheck"><br>
                   
                   FuelCost  <input type='integer'name='fuel_cost'></input><br>
                    Destination <input type='text' name='destination'></input> <br>
                    Flight Departure <input type='text' name='flight_departure'></input><br>
                    Other Information <input type='text'></input><br>
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
          </div>
    `)
}


function listenNewFlightForm () {
  $('button#ajax-new-flight-form').on('click', function (event) {
    event.preventDefault()
    // let newFlightForm = Flight.newFlightForm()
    // document.querySelector('div#new-flight-form').innerHTML = newFlightForm
    let newFlightForm = Flight.newFlightForm


    let myNewFlightHTML = newFlightForm

    document.querySelector('div#new-flight-form').innerHTML = myNewFlightHTML
  })
}

$('#newFlightForm').on('submit', function (e) {
  e.preventDefault()
  // const values = $(this).serialize()

  // $.flight('/flights', values).done(function (data) {
  //   $('#new-flight-form').html('<h2> hold my spot</h2>')
  //   // const newFlight = new Flight(data)
  //   // const htmlToAdd = myflight.flightHTML()

  //   let myflight = new Flight(data[0])
  //   let myFlightHTML = myflight.flightHTML()
  //   $('#new-flight-form').html(myFlightHTML)
  
  })

})


