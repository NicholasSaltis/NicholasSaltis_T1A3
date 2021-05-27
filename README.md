# TERMINAL APPLICATION T1A3

## The Bakers Box

### by Nick Saltis

#### [Github Repository](https://github.com/NicholasSaltis/NicholasSaltis_T1A3)

---

### What is The Bakers Box?

This app is a ruby based terminal application based loosely on the concept of the baker's percentage, a way of writing baking recipes that uses percentages instead of explicit weights. This application allows recipes to be created, edited and stored and then selected to be converted by flour weight or total recipe weight. 

### Why use this?

I am a hobbyist baker and have experienced the tedium of converting recipes to a percentage base and back with the calculations changing each time depending on the amount of flour im using, or the target weight of the recipe in addition to recording and tweaking recipes that I like to use. I designed this application to make the process of converting recipes quick, flexible and repeatable as well as making storing recipes that I have made or used simple and transportable. All edits can be made within the application and are stored in a JSON file which makes the data transferrable as well. 

### Who would use this?

As a package, the features of this app make for a handy companion to a hobbyist baker and even small business size bakeries that need to change their recipe sizes based on fluctuating demand or quantity of available ingredients.

### How it would be used

Once correctly installed to a computer, ideally a laptop so that it could be used in the changing envrionment of a kitchen/bakery, the user would load up the app and select an option depending on what they would be doing. The app comes with a pre-entered recipe but the user would probably first add a new recipe and then select it to convert its value based on their input. A user might also use it to digitise a recipe book that they have been using to safeguard it from damage or loss.

---

### Features:

* ##### Main Menu:

  The first and main screen of the app. It features a simple ASCII title and welcome message greet the user and menu with navigation options for the app. It serves as the home page for the app with all other features returning back to the main menu. The menu is navigatable using the TTY-prompt gem and the up and down arrow keys with enter/return being used to select an option.

![BakerBoxmainmenu](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/BakerBoxmainmenu.png)

* ##### Recipe Book:

  The recipe book displays the names of all recipes that are loaded into the app. Recipe names are dynamically added to the options for a tty-prompt select menu allowing the user to select the name of the recipe itself and for the options to update within the same session if recipes are added or deleted. It also has a back to main menu option for simple navigation.

![RecipeBook](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/RecipeBook.png)

* ##### Conversions:

  Upon selecting a recipe from the Recipe Book, the user can view the details of the chosen recipe with ingredients represented by percentage values. The user then has 3 options, presented by TTY-prompt:

  * Convert from flour weight: 

    first checks if the chosen recipe contains flour as an ingredient and if it  does prompts the user to enter a number for weight of flour used in grams and then calculates the total weight of the recipe and the subsequent weight of each ingredient given their percentage values and then prints the recipe with ingredient weights in grams and total weight of recipe. If the recipe does not have flour as an ingredient the user in prompted to either select the convert by flur weight option or return to the main menu to either add a new recipe that contains flour or edit an exisiting one.

  * Convert from total weight:

    multiplies each recipes percentage value by the input total weight to find their respective weight in grams and prints the results

  * Return to Recipe Book:

    User can go back a page to either select a different recipe to convert or continue on back to the main menu.

  The app will loop in the conversion step until the user selects return back to recipe book.

![Conversion_options](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/Conversion_options.png)

* ##### Add recipe:

  The user can input a new recipe to be stored in the JSON file and added to the recipe book, all within the same session. The user is prompted to enter a name for the recipe which is validated by a method which ensures that it isnt too long (>50 characters) and isnt a data type that would disrupt the program. If it is an unwanted input the user is prompted to reenter the input correctly. The user can then select to add an ingredient to ingredient which calls a method that captures and validates user input for an ingredient name and value that represents a percentage of 100% in decimal format. Eg, 0.5 = 50%. That ingredient value pair is added to an array and the user is prompted again to either add an ingredient or finish and save recipe. The app loops over this add ingredient function until the user finishes and saves at which point the recipe name and ingredient array and initialized within the RecipeBook class to be used elsewhere within the app.

![Add_recipe](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/Add_recipe.png)

* ##### Edit Recipe:

  The user can select an existing recipe to edit with the options to either add or delete an ingredient, do both at once and select an ingredient to replace with a new input and Delete recipe. The user can also select to return to the main menu. Add/Replace ingredient options access the ingredients array and modify it accordingly with those changes persisting. The delete recipe option calls the list of recipes stored within the RecipeBook class and removes the selected recipe. All changes made are saved by formatting and writting to the JSON file on app close.

![Edit_Recipe](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/Edit_Recipe.png)

* ##### Help Section

  The Help option from the main menu brings the user to a menu selection for different features of the app. selecting a features prints a formatted text block with details or instructions relating to the feature. The user can then select to view a different help page or return to the main menu.

![Help](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/Help.png)



---

#### UI/UX 

The app is navigated using the __u__ and __down__ arrow keys to parse menu options and pressing __return/enter__ key to select an option or confirm user input. Main Menu is the home page with every branch returning to it via last menu options one step each time. This is simple and fast and if the user gets lost they can easily return to main menu. ASCII titles clearly identify which page the user is on so they do not get confused. 

User input occurs in the conversion section where the user is prompted to input a number and this is validated to ensure that it is >0 and not any other data type which prevents errors from occuring in the conversion methods. The user will also have to provide inputs for adding recipe names, ingredient names and percentage values. These are also validated to prevent unwanted data types/values and ensures that they work with the methods in the app. The app also handles the formatting of user input into both display functions and into JSON format. Errors that might occur due to modification of the JSON file are handled by rewritting the file with a correct format + placeholder recipe if JSON is empty, or just adding a placeholder recipe if the recipes hash of the JSON file is empty. TTY-prompt both provides a fantastic user experience and prevents errors occuring due to unwanted user input.

---

#### Design Process 

##### FlowChart

![The Bakers Box flowchart](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/The Bakers Box flowchart.png)

##### Project Management

[My Trello Board for The Bakers Box](https://trello.com/b/kBMiqo76/the-bakers-box)

I used trello to manage this project. I made user story cards to keep track of the UX as i developed this app and then made made three cards for my three main features and had checklists with goals that needed to be completed. I then used 4 columns: Pending tasks, In Progress, Testing, Passed Tests and Implemeted. The goal was to pass cards from the pending tasks column through the various stages of development.

![Trello_screenshot](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/Trello_screenshot.png)

##### Testing 

Link to [Manual Testing Sheet](https://docs.google.com/spreadsheets/d/1IjwCPN0_xXR3C6Qozd3hKkgfm8MrKYm4_tJB2_HIeC0/edit?usp=sharing)

Manual testing was used in the development of this app. I used a manual testing sheet for the loading of the recipes.json file, both conversion methods, flour in recipe detection for flour weight conversion and the validation of user inputs by rejecting unwanted values (both for names, and percentage values)

![Google Sheets Manual Testing](/Users/nick/Documents/flextrack/assignments/NicholasSaltis_T1A3/docs/Google Sheets Manual Testing.png)

---

### Installation/Usage instructions

1. __Install Ruby__: Ruby is required to run this application. Ruby 2.7 is the stable recommended version but the latest Ruby 3.0.1 version runs perfectly fine. 
2. __Install Bundler__: Bundler is a ruby gem that reads the gem file in the src folder and installs all listed gems and their dependancies for you. [Link to Bundler website](https://bundler.io/) or ```$gem install bundler```
3. __Download files from Github__: Either pull from Github repository using Git, or download and unzip files to your local machine. [Github Repo](https://github.com/NicholasSaltis/NicholasSaltis_T1A3)
4. __Give execute permission to install.sh__: The bash script needs execute permission to be able to run on your machine. Change directory to the source folder of The Bakers Box run ```$chmod +x ./install.sh```
5. __Run install.sh__: In the directory of the src code run ```$./install.sh```. This will give execute permission to run_app.sh, run bundler and install all gems/gem dependancies from gemfile, and then run ```./run_app.sh -u``` which will run the app with a short tutorial message detailing how to use the app.
6. __Run run_app.sh__: The Bakers Box is now installed and ready to use! To run the app again just use ```./run_app.sh``` from the command line. 

##### Command line arguments:

* -h or -help will run the app but jump straight to the help section.
* -u or -usage will show the simple tutorial screen which then moves on to the main app.
* -r or -recipes will run the app but jump straight to the Recipe Book section. 

The app only accepts one argument. If more than one is passed then the first argument will be used.

##### OS/Hardware requirements: 

* App built and tested on Mac OS Version 11.3.1
* This application should operate on any system that can install the approved ruby versions.
* Ruby Gems Bundled in gem file:
  *  tty-prompt: user input management, option select menu functionality. [https://github.com/piotrmurach/tty-prompt](https://github.com/piotrmurach/tty-prompt) 
  * tty-box: Framing for text in terminal. [https://github.com/piotrmurach/tty-box
  * tty-screen: Terminal window size detection for co-use with tty-box. [https://github.com/piotrmurach/tty-screen
  * colorize v 0.8.1: Colours terminal output, used to colour ascii titles. [https://github.com/piotrmurach/tty-screen](https://github.com/piotrmurach/tty-screen)
  * artii: string to ascii art converter using FIGlet library. Used for ASCII titles on each page. [https://github.com/miketierney/artii](https://github.com/miketierney/artii)
* Rspec used for testing purposes, not required for usage.
* Monitor and keyboard required.

##### Usage: 

* Use arrow keys up and down to navigate menus. 
* Press enter to select a highlighted menu option. 
* Use keys to enter numbers or text when prompted. 
* Use last menu options to return to previous page. 
* Keep choosing last option to return to main menu. 
* To exit the app select the exit option from the main menu.

---









