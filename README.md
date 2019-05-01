# README


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




Log in. ><Frank 1234>
Brad Video. Look at 49.06 mins. For Break down of the project

Questions.

 Is there a CSS Boilplates code that i can copy an pastes just to make the app look a little pretty.

 Step-by-Step. 
1.	√ Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.

 For example: in a blog domain with users and posts, you might display the index of the user's posts on the users show page, fetching the posts via a AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

2.	Must render at least one show page (show resource - 'one specific thing') via JavaScript  (Im not sure if I cover this part yet.)
and 
√ an Active Model Serialization JSON Backend.

Borrowing from the previous blog domain example, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched via AJAX and rendered through JavaScript.

3.	√ Your Rails application must dynamically render on the page at least one 'has-many' relationship through JSON using JavaScript.

In the previous blog domain example, if each of the posts has many comments, you could render those comments as well on that post's show page.

4.	√Must use your Rails application and JavaScript to render a form for creating a resource that submits dynamically.


In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).
Template Engineers. Might be resources

5.	√ Must translate the JSON responses into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. 
√Formatters work really well for this.

Borrowing from the blog domain example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.

 NOte Of where the app is.
  When we hit submit for Ajax, the Form is submiting to flight_controller index.

  we want it to submit to app/assests/ javascripts/line 39.  document.querySelector('div#new-flight-form').innerHTML

  good Source... : https://learn.co/tracks/full-stack-web-development-v6/rails-and-javascript/building-apis/receiving-api-posts


  Json...
  Json--- Part at 20 -25 min contains what you need.

submit form in the same file
  https://www.youtube.com/watch?time_continue=6&v=Yd0nH9CWWfo




  Incase if ti needd

//  myCheck is for the validation of the checkBox as it is coded in rails verfactiion to check for boolean
// var myCheck = false;
// $('#myInput:checked').click(function() {
//    // only if it is checked
//    isCheckedWithGlobalVariable = true;
// })





Sample.... for the New form by susan

 Creat action

Here's my create action: def create
   @organization = Organization.create(params[:organization_id])
   @event = current_user.events.build(event_params)

   if @event.save!
     # respond_to do |f|
     #    f.html {redirect_to events_path }
        render json: @event
   else
      render "new"
    end
 end
 >>>>>>>>>>>

and my new.html.erb: <div id="new-js-event"></div>

<h1>Create a New Event</h1>
<div id="js-new-event">
    <%= form_for(@event) do |f| %>

    <%= f.label :name %><br>
    <%= f.text_field :name %>
    <p>

    <%= f.label :cause %><br>
    <%= f.text_field :cause %>
    </p>
    <p>
    <%= f.label :location %><br>
    <%= f.text_field :location %>
    </p>
    <p>
    <%= f.label :datetime %><br>
    <%= f.datetime_field :datetime %>
    </p>
    
    <%= f.label :organization_name, "Organization Name" %><br>
    <%= f.collection_select(:organization_id, Organization.all, :id, :name, {include_blank: "Please select name"})%>
    <br>
</div>
    <button class="new-event">    
    <%= f.submit "Create Event" %><br />
    </button>
<% end %>

<p>
<%= link_to "Back", events_path, class: "btn btn-primary btn-light" %></p>    
<p><%= link_to "View Events", events_path %></p>
<p> Don't see your organization? Create it <%=link_to "here", new_organization_path %></p>
<br />

OTher notes

In my case, I had a hyphen where I needed an underscore - 'form.new_event' instead of 'form.new-event').on('submit', etc...