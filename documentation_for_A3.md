## PseudoCode

1. call welcome method to display logo and welcome message

2. call main menu method underneath welcome with tty-prompt selections.

3. if exit, exit app.

   if help, puts help message.

   if view recipe book, display recipe objects and options menu

   ​	if return to main menu

   ​		return to main menu

   ​	if selects recipe from list

   ​		display recipe and options menu

   ​			if comment/note

   ​				get user input and add to comments array.

   ​				loop over this until break keyword eg. done.

   ​			if convert recipe from flour weight

   ​				get user input of flour weight in grams

   ​				loop over the recipe array and convert each ingredient

   ​				based on percentages.

   ​				output converted recipe in grams

   ​			if convert recipe from desired weight

   ​				get user input of total weight in grams.

   ​				loop over the recipe array and convert each ingredient 

   ​				based on percentages and total desired weight.

   ​				output converted recipe in grams.

   ​			else return to recipe list.

   if add recipe, run recipe.new

   if edit recipe, display list of recipe objects.

   ​	user selects recipe.

   ​	displays recipe

   ​	if	user selects ingredient to edit.

   ​		user updates value of ingredient.

   ​		loops back to ingredient selection

   ​	else return to recipe list

   