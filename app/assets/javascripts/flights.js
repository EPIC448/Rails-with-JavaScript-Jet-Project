$(document).ready(function() {
     console.log("javaScript is loading and working")
    listenForClick()
});


function listenForClick() {
    $('button#flights-data').on('click', function (event) {
        event.preventDefault()
        getPosts()
    })
}

// //show flight (for just one flight) - could also show the has_many relationship, maybe for passengers
// //new form for either a flight or a passenger
    
 function getPosts() {
     $.ajax({
         url: 'http://localhost:3000/flights',
         method: 'get',
         dataType: 'json',
     }).done(function(data){
       
         console.log("the data is: ", data)
         let myflight = new Flight(data[0])
         let myFlightHTML = myflight.flightHTML()
         document.getElementById('ajax-flights').innerHTML += myFlightHTML
      })  
     }



    class Flight{
        constructor(obj){
        this.id = obj.inspection
        this.id = obj.fuel_cost
        this.id = obj.destination
        this.id = obj.flight_departure
        this.id = obj.flight_sit
       }
    }

 Flight.prototype.newFlight = function() {
    return(`
        <strong>New Flight Form</strong>
        <form>
            <input id='flight-fuel_cost' type='integer' name='fuel_cost'></input><br>
            <input type='integer'name='fuel_cost'></input><br>
            <input type='text' name='destination'></input><br>
            <input type='text' name='flight_departure'></input><br>
            <input type='text'></input><br>
            <input type='submit' /><br>
        </form>
       `)
    }


    // New Form

function listenForNewForm() {
    $('button#ajax-new-flight-form').on('click', function (event) {
        event.preventDefault()
        let newFlightForm = Flight.newFlightForm()
        document.querySelector('div#new-flight-form').innerHTML = newFlightForm
    })
   }

postMessage.prototype.FlightHTML = function () {
    let flightUser = this.flight.map(flight_ride => {
        return(
            <p>${flight_ride}</p>
        )
    }).join('')

    return(
        <div>
            <h4>${this.inspection}</h4>
            <h4>${this.destination}</h4>
        </div>
    )
}


 