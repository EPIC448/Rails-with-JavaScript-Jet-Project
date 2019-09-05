# README

<<<< Start the Server 
 rails server  (ruby on rails)
 python -m SimpleHTTPServer   (JavaScript)

 <<<<<<<<>>>>>>>>

Project Title
 RAils_with_JavaScript_Jets_Project.
  This Project simulate owning a private Jets. In which the User would be able to see what Jets are available, go on a flight-ride, make sure the Jets pasted inspections, and even able to delete a created jets.
  
   This is a dupilcated project of the orginal Ruby on Rails Jet Project. However, the front-end section was added to this project built with JavaScript. 


  In the Process of creating what type of flight they want, the User can choose:
   Destination
   Number of Set in the "created Jets"
   Select option of the Jet passing inspections
   And Cost of Fuel to run the jet
  

 Prerequisites
  gem 'rails', '~> 5.2.1'
  gem 'thin'
  gem 'omniauth'
  gem 'dotenv-rails'
  gem 'omniauth-facebook'
  gem 'pry'
   gem 'bcrypt', '~> 3.1.7'


* Database creation (Scheme)
ActiveRecord::Schema.define(version: 2018_11_09_230939) do

  create_table "flight_rides", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flight_id"
    t.string "flight_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.boolean "inspection", default: false
    t.integer "fuel_cost"
    t.string "destination"
    t.integer "flight_departure"
    t.integer "flight_sit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "user_cash"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

* Database initialization


* Services (job queues, cache servers, search engines, etc.)
   Google Chromo

* Deployment instructions

  In the Jet-Rails-Project Diretory,  you are going on type in the terminal

  Thin start --ssl 
   this will ensure that your Url Address in the browser most be prefixed with HTTPS://

   In the Browser address bar, you Type

   https://0.0.0.0:3000/ Or

   BootStrip was added to the Project
    to Booth it, We say

 1. Open up the Terminal to the     Jet-Rails-Project-Directory
 2.Type in "Rails Server"
 3. make sure you link to http://localhost:3000/
 4. And there you have it.

   This will open up the project for you

 * Author
 Samuel Ogundiran
 Samrey2018@gmail.com

 License
This project is free


Requirements. 

 Step-by-Step. 
1. Done	 Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.

 For example: in a blog domain with users and posts, you might display the index of the user's posts on the users show page, fetching the posts via a AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

[This is index request.. from javascript ]https://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/using-active-model-serializer

2.	Must render at least one show page (show resource - 'one specific thing') via JavaScript  (Im not sure if I cover this part yet.)

√ an Active Model Serialization JSON Backend.
independent of index Request. AKA another function. in Javascipt. 
[This is Seperate  request for the show... ] https://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/diy-json-serializer

this was helpful.. https://github.com/EPIC448/receiving-api-posts-v-000

Borrowing from the previous blog domain example, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched via AJAX and rendered through JavaScript.

3.	This is index request.. ]√ Your Rails application must dynamically render on the page at least one 'has-many' relationship through JSON using JavaScript.

> Flight_ride show on page [all of them].  https://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/using-to_json
 > 
In the previous blog domain example, if each of the posts has many comments, you could render those comments as well on that post's show page.

4. 	√Must use your Rails application and JavaScript to render a form for creating a resource that submits dynamically.


In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).
Template Engineers. Might be resources
> This is will help with creating and displaying a form.
> https://learn.co/tracks/full-stack-web-development-v7/rails-and-javascript/building-apis/receiving-api-posts

5. Done.	√ Must translate the JSON responses into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. 
√Formatters work really well for this.

Borrowing from the blog domain example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.








