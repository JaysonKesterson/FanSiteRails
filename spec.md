# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - Used Rails
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - Teams have many Players
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Players Belong to a team
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) Teams and Fans both have many of each other through FanTeams
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) Fans and Teams have a many to many relationship
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) Die Hard Fan is an attribute of the join model
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) My models have validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - used .where and .order in the project
- [x] Include signup (how e.g. Devise) - signup functionality added
- [x] Include login (how e.g. Devise) - login functionality added
- [x] Include logout (how e.g. Devise) - logout functionality added
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Users can log in through facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - Players index is nested inside of teams
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - players new is nested resource inside team
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - error messages display on validation failures

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate