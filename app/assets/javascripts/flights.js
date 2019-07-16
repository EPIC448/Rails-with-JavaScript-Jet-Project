


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
      <h1>${this.id}</h1>;
      <h2>${this.inspection}</h2>;
      <h2>${this.fuel_cost}</h2>;
      <h2>${this.destination}</h2>;
      `
       
    }

  }

  

  
  // https://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/receiving-api-posts 
  //var posting = $.post('/posts', values);  
  // posting.done(function(data) {  
   //      var post = data;        
  // $("#postTitle").text(post["title"]);    
   //     $("#postBody").text(post["description"]); 
    //    var post = new Post