$(document).ready(function() {
    console.log(yay!)
})


//$(() => {
    //bindClickHandlers()
//})
// Issue... JS is not loading. Solution: Brad and Ceren (start of the videos.)

//functions you need ot create or you can hijack the buttons that are already do this is functions.
//load flights
//show flight (for just one flight) - could also show the has_many relationship, maybe for passengers
//new form for either a flight or a passenger
    
const bindClickHandlers = () => {
        $('.all_flights').on('click', e => {
            e.preventDefault()

            alert("Why you click me")

            history.pushState(null, null, "noway")
            fetch(`/flights.json`)
            .then(response => response.json())
            .then(flights => {
                $('#app-container').html('')
                flights.forEach(flight => {
                    let newFlight = new Flight(flight)
                    let flightHtml = newFlight.formatIndex()
                        $('#app-container').append(flightHtml)
                })
            })
        })
    }

    function Flight(flight){
        this.id = flight.inspection
        this.id = flight.fuel_cost
        this.id = flight.destination
        this.id = flight.flight_departure
        this.id = flight.flight_sit
 }

 Flight.prototype.formatIndex = function() {
     console.log(this)
    let flightHtml = `
     <a href="/posts/${this.id}"></a><h1>${this.destination}</h1>
    `
    return flightHtml 
    
 }