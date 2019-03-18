
$(() => {
    bindClickHandlers()
})

    
const bindClickHandlers = () => {
        $('.all_flights').on('click', (e) => {
            e.preventDefault()
            history.pushState(null, null, "flights")
            fetch(`/flights.json`)
            .then(response => response.json())
            .then(flights => {
                $('#app-container').html('')
                flights.forEach(flight => {
                    let newFlight = new Flight(flight)
                     let flightHtml = newFlight.formatIndex()
                        $('#app-container').append(flightHtml)
                    console.log(flight)
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

 Flight.prototype.formatIndex = function () {
     console.log(this)
    let flightHtml = `
     <a href="/posts/${this.id}"></a><h1>${this.destination}</h1>
    `
    return flightHtml 
    
 }