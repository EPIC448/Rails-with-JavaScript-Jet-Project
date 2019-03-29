$(document).ready(function() {
     console.log("javaScript is loading and working")
    listenForClick()
    listenNewFlightForm()
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
         document.getElementById('ajax-flights').innerHTML = myFlightHTML
      })  
     }




    function listenNewFlightForm() {
        $('button#ajax-new-flight-form').on('click', function (event) {
            event.preventDefault()
            let newFlightForm = Flight.newFlightForm()
            document.querySelector('div#new-flight-form').innerHTML = newFlightForm
        })
    }
       

    class Flight{
        constructor(obj){
            
        this.id = obj.inspection
        this.id = obj.fuel_cost
        this.id = obj.destination
        this.id = obj.flight_departure
       }
    

     static newFlightForm() {
            return(`
                <strong>New Flight Form</strong>
                <form>
                   Inspection <input type="checkbox" id="myCheck"><br>
                   FuelCost <input type='integer'name='fuel_cost'></input><br>
                    Destination<input type='text' name='destination'></input> <br>
                    Flight Departure<input type='text' name='flight_departure'></input><br>
                    Other Information<input type='text'></input><br>
                    <input type='submit' /><br>
                </form>
            `)
        }
       } // end of flight class
     



Flight.prototype.flightHTML = function () {
    // debugger
    // let flightUser = this.flight.map(flight_ride => {
    //     return(`
    //         <p${flight.flight_ride}></p>
    //     `)
    // }).join('')

    return(`
        <div>
            <h4>${this.inspection}</h4>
            <h4>${this.destination}</h4>
        </div>
    `)
}


 