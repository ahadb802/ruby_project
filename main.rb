require_relative './app'
require_relative './menu'
require_relative './preserve_data'

menu = Menu.new
app = App.new
menu.add_option('List all books', -> { app.list_all_books })
menu.add_option('List all Labels', -> { app.list_all_labels })
menu.add_option('Create a Book', -> { app.add_book })
menu.add_option('Quit', -> { app.exit_app })
menu.show
