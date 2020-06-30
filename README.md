# README

... Refactor First commit

**Project Title**

**Motivation**

**Rail/ JavaScript Jet Project**

  *MOTIVATION*
 ![](https://media.giphy.com/media/NSEXOrnVgRVZ4eZdlE/giphy.gif)
    I have always enjoyed flying and living in different places. It  always amazes me what goes into building a Aeroplan and it functionality. However,  seens I am not a Pilot, I can pretend to be a Plan mainfacture through coding and Creating my own plan when I want. Thus, i created this project. 
    

    This Project simulate owning a private Jets. In which the User would be able to see what Jets are available, go on a flight-ride making sure the Jets pass inspections, and even able to delete a created jets .
   
   *Feature the User can add to there plan*

    Creating a Plan comes with a ton of Responsiblity, So to make sure the user is safe,  They can choose features such as :
    >Destination
    >Number of Set in the "created Jets"
    > If jet passes inspections
    > And Cost of Fuel to run the jet
  
**Summary**

  Using Active Record Mechanics(CRUD), we are able to create data and retrive the data as needed. Also, we created a table using SQL. Also, has_many, belongs_to, has_many :through relationship models were used for the project.

  Also, using the Omniauth gem authenitication, a user can login the app with there *Facebook Account* or use the Normal Login method by creating an account on the app. 

  **Code_Sample**

   ``` 
   def require_logged_in
        redirect_to root_path unless logged_in?

    end

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end
     

    def logged_in?
        !!current_user   #only produces false

    end
  ```


**Tech/Framework used**
![](https://media.giphy.com/media/MarRSACy8q3MPtXKQq/giphy.gif)
  *Ruby version*
   *System dependencies*
   Link for all Ruby related project.s

 Prerequisites
  gem 'rails', '~> 5.2.1'
  gem 'thin'
  gem 'omniauth'
  gem 'dotenv-rails'
  gem 'omniauth-facebook'
  gem 'pry'
   gem 'bcrypt', '~> 3.1.7'



  *Database creation (Scheme)*
  
  
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



**Installation**


 Using Google Chrome may be your best bet.

*Deployment instructions*

1. In the Jet-Rails-Project  Diretory,  you are going  on type in the terminal

        Thin start --ssl 
   this will ensure that your Url Address in the browser most be prefixed with "HTTPS://"

2. In the Browser address bar, you Type

   https://0.0.0.0:3000/ Or

   BootStrip was added to the Project this project to Booth it,
    follow the instructions below.

3. Open up the Terminal to the      Jet-Rails-Project-Directory
 
4.  Type in "Rails Server"

5. make sure you link to http://localhost:3000/

6. And there you have it.

   This will open up the project for you



 **Commiting to Git hub**

[ ]Open the terminal.

[ ]Change the current working directory to your local repository.

[ ]Commit the file that you've staged in your local repository.

[ ] $ git commit -m "Add existing file" Push the changes in your local repository to GitHub.

[ ]$ git push origin branch-name.

 * Author
 Samuel Ogundiran
 Samrey2018@gmail.com

 License
This project is free





