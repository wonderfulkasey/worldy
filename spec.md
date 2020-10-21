# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project  
    used Ruby on Rails

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    User has_many Worlds, World has_many Characters, World has_many Plots

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)  
    World belongs_to User, Character belongs_to World, Plot belongs_to World

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)  
    User has many Characters through Worlds; User has many Plots through Worlds

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)  
    Genre has many Worlds through Plots; World has many Genres through Plots

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)  
    (Character: name, class, alignment, species, description; 
    World: name, description, aesthetic, genre;
    Plot: title, importance, description)
    
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)  
    Have validations in user, world, character, and plot models

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)  
    worlds/most_plots shows the world with the highest amounts of plot

- [x] Include signup (how e.g. Devise)  
    using Devise, customized to include name, username, email and password at creation of account 
    
- [x] Include login (how e.g. Devise)  
    Login using Devise

- [x] Include logout (how e.g. Devise)  
    Using Devise

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)  
    OmniAuth with GitHub

- [x] Include nested resource show or index (URL e.g. users/2/recipes)  
    Can see (ex) /worlds/1/characters/1

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)  
    Can see (ex) /worlds/1/characters/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)  
    All places have validation errors ready for the name or title.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate