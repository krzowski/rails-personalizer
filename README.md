# Personalizer - calories consumption tracker  

## about the project
Personalizer is a Rails application inspired by a [design concept by Husam Elfaki from dribbble](https://dribbble.com/shots/2457364-Shot-098-Calories-Calculator). It allows users to track their daily calories consumption and burned calories from exercises. 


Personalizer was developed with:

* Devise as an authentication library, 
* html canvas to draw progress bars/squares
* jquery + ajax
* simple_calendar gem to display calendar by two-week intervals, 

## try it out
visit [project's website](http://personalizer.herokuapp.com) and login with test credentials:

* email: testaccount@example.com, password: qwerty

or create your own account!

## local setup
download the code:

    git clone https://github.com/krzowski/rails-personalizer.git

navigate to root folder and install dependencies with:

    cd rails-personalizer/ && bundle update

run database migrations:

    rake db:migrate

start server with:

    rails s
