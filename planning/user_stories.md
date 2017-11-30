### MVP

* A user should be able to browse all public recipes by title
* A user should be able to open all public recipes and see who wrote them, their
  comments, and the title and instructions
* A user should be stopped when trying to add a new recipe on the index
* A user should be unable to access the recipes/new page
* A user should be stopped when trying to edit/delete a recipe on its show page
* A user should be unable to access recipe edit and delete pages
* A user should be able to choose whether to sign up/sign in from every page
* A user should be able to enter an email, a name, a display name, and a
  password (2x) on a signup page
* A user should be unable to sign up if any of their information is wonky
* A signed-in member's display name or name should pop up when signed in
* A member should be able to add recipes and edit/delete recipes that they added
* Member data should be stored in the database
* Member passwords should be hashed
* Members should see a sign-out link at the top of their windows
* Members should be able to sign out and see a public version of the app and be
  notified that they've logged out
* Members should be able to log in by entering their email address and password
* Password should validate against hashed one in database
* User authentication with bcrypt

### Silver

* Users should be able to favorite recipes
* Users should have access to all the recipes that they have favorited ---
  (accomplished)
* Member passwords should be salted
* A member should be able to set the publicity status of recipes he/she adds
* A user should be able to scroll through only recipes that are public
* A member should be able to change the publicity status of any recipe they have
  created
* Members should be able to scroll through all recipes, including private ones
  that they have posted
* Created recipes should default to public
* A user should be able to submit their information and be redirected to the
  page they were on

### Gold

* User authentication without bcrypt
* Incorporate signups with Facebook and Google API's
* Members should be able to add other members as friends and see their private
  recipes
* Recipes should be able to be defined within larger categories (ex. Italian
  food) to make searching for recipes simpler
