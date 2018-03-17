Specifications for the Sinatra Assessment
Specs:

 [X] Use Sinatra to build the app
        I am requiring the Sinatra gem in my gemfile (lines 8 and 10), and I have various Sinatra Controllers (application_, articles_, topics_, users_) that run my program.
 [X] Use ActiveRecord for storing information in a database
        I require ActiveRecord in my gemfile (lines 9 & 10), and my models and migrations all inherit from ActiveRecord. It's used throughout my app.
 [X] Include more than one model class (list of model class names e.g. User, Post, Category)
        I have a User, Topic and Article model.
 [X] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
        User has_many Topics.  Topic has_many Articles.
 [X] Include user accounts
        Please see my users_controller.rb file to see how user accounts are set-up for the app.
 [X] Ensure that users can't modify content created by other users
        There are various validations on controller action routes. These will affect who can see or modify which content.
 [X] Ensure that the belongs_to resource has routes for Creating, Reading, [] Updating and Destroying
        Topics have full CRUD capability and standard CRUD routes.  Articles have modified CRUD capability. Articles can be read, created, updated and destroyed, but it doesn't have all the standard CRUD routes.  
 [X] Include user input validations
        Please see the files in my models folder. User.rb has validates_presence_of, AND validates used, while article.rb and topic.rb have validates_presence_of.
 [X] Display validation failures to user with error message (example form URL e.g. /posts/new)
        User will receive flash[:message]'s when he/she doesn't get access to the page they wish to see.
 [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        Please see the README file, and CONTRIBUTING.md and LICENSE.txt in the project directory.

Confirm

 [X] You have a large number of small Git commits
        Yes, upwards of 70 I think.
 [X] Your commit messages are meaningful
        I tried my best to keep them short and explain what was done.
 [X] You made the changes in a commit that relate to the commit message
        Yes.
 [X] You don't include changes in a commit that aren't related to the commit message
        Yes. On this I screwed up a few times, so I made a comment on some commits, to try and catch up the other changes that weren't in the commit message itself.
