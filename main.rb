require_relative './app'
require_relative './menu'

menu = Menu.new
app = App.new
menu.add_option('List all books', -> { app.list_all_books })
menu.add_option('List all Labels', -> { app.list_all_labels })
menu.add_option('Create a Book', -> { app.add_book })
menu.add_option('List all Games', -> { app.games_list })
menu.add_option('List all Authors', -> { app.authors_list })
menu.add_option('Create a game', -> { app.create_game })
menu.add_option('Quit', -> { app.exit_app })
menu.show
