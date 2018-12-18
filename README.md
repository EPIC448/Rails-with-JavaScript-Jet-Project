# README


Project Title
 Jets Rails Project.
  This Project simulate owning a private Jets. In which the User would be able to see what Jets are available, go on a flight-ride, make sure the Jets pasted inspections, and even able to delete a created jets.

  In the Process of creating what type of flight they want, the User can choose:
   Destination
   Number of Set in the "created Jets"
   Select option of the Jet passing inspections
   And Cost of Fuel to run the jet
  

* Prerequisites
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

   https://0.0.0.0:3000/

   This will open up the project for you

 * Author
 Samuel Ogundiran
 Samrey2018@gmail.com

 License
This project is free