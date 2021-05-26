# tty-prompt options to display after text displayed from main help options choice.
def second_help_options
  second_help_options = [
                          {name: "Select another topic", value: 1},
                          {name: "Return to main menu", value: 2}
                        ]
  second_help_options_selection = $prompt.select("What would you like to next?", second_help_options)
  case second_help_options_selection
  when 1
    main_menu(4) # shortcuts to help section
  when 2
    main_menu(main_menu_prompt) # returns to main menu.
  end
end
# case statment for selection of tty-prompt options output. displays text formatted in a box using tty-box and with an ascii title (artii) then calls second_help_options
def help
  clear
  ascii_heading("Help")
  # options for menu
  help_options = [
                   {name: "Recipe Book", value: 1},
                   {name: "Conversions", value: 2},
                   {name: "Adding a recipe", value: 3},
                   {name: "Editing or Deleting a recipe", value: 4},
                   {name: "Navigating the app", value: 5},
                   {name: "Return to Main Menu", value: 6},
                 ]  
  help_options_choice = $prompt.select("Please select a topic you would like to know more about", help_options)
  # case statement using choice.
  case help_options_choice
  when 1
    clear
    ascii_heading("Help")
    # tty-box string format can only have one string passed so new line characters used. screen width dynamic using tty-screen.
    help_frame = TTY::Box.frame( width: TTY::Screen.width,
                                 padding: 1,
                                 top: 8,
                                 align: :left
                                ) do
    "The Recipe book contains a list of the names of all stored recipes. \nA recipe can be selected to display its title and ingredients \nalong with an options menu for what to do with it. \nAt the bottom of each prompt menu is a back option which takes you back to the previous screen. \nFrom the Recipe Book the back option returns you to the main menu."
      end
    print help_frame
    second_help_options
  when 2
    clear
    ascii_heading("Help")
    help_frame = TTY::Box.frame( width: TTY::Screen.width,
                                 height: 14,
                                 padding: 1,
                                 top: 8,
                                 align: :left
                                ) do
    "When a recipe has been selected from the Recipe Book, you can choose between two conversion options or a back to Recipe Book option. The flour weight conversion option requires an input number greater than 0 and interprets it as a number of grams. you do not need to specify what unit of measurement the number.\nThe total weight conversion option does the same as the flour weight option but takes a number equal to the total desired weight of the recipe and converts each ingredient accordingly\nthe conversion options continue looping indefinitely until the user chooses to return back to the Recipe Book page."
    end
    print help_frame
    second_help_options
  when 3
    clear
    ascii_heading("Help")
    help_frame = TTY::Box.frame( width: TTY::Screen.width,
                                 height: 15,
                                 padding: 1,
                                 top: 8,
                                 align: :left
                                ) do
    "You are able to input a new recipe to be stored in the app by selecting the \"Add new Recipe\" option from the main menu. This features stores ingredient name and percentage value pairs one by one and indefinitely until the user selects the \"Finish and save to Recipe Book\" option.
    The input percentage value should be a decimal number between 0 and 1 that represents the ingredient's percentage of the whole recipe eg. 0.5 is interpreted as 50%, 0.01 is interpreted as 1%. as such, your input recipe's percentage values combined should equal 1 as conversions of this recipe will be the most realistic and accurate."
    end
    print help_frame
    second_help_options
  when 4
    clear
    ascii_heading("Help")
    help_frame = TTY::Box.frame( width: TTY::Screen.width,
                                 height: 10,
                                 padding: 1,
                                 top: 8,
                                 align: :left
                                ) do
    "Selecting the \"Edit recipe\" option from the main menu allows you to select a recipe and either add new ingredients, edit or remove existing ingredients or delete the recipe entirely. This can be used to fix an error made when adding a recipe or to tweak a recipe if it is not producing desirable results. Be careful, a deleted recipe is permanently deleted a will need to be re-entered if accidentally removed."
    end
    print help_frame
    second_help_options
  when 5
    clear
    ascii_heading("Help")
    help_frame = TTY::Box.frame( width: TTY::Screen.width,
                                 height: 10,
                                 padding: 1,
                                 top: 8,
                                 align: :left
                                ) do
    "Navigation of the app uses the arrow keys up and down to scroll through menu options and the enter button is used to select options and confirm user input. You will be prompted to enter text or numbers when adding/editing a recipe or performing a conversion. The app can be closed by selecting the \"Exit\" option from the main menu or in the case of malfunction with CTRL + C"
    end
    print help_frame
    second_help_options
  when 6
    clear
    main_menu(main_menu_prompt) # return to main menu.
  end
end