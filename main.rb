require_relative './app'
require_relative './menu'

menu = Menu.new
app = App.new
app.albums.load_albums
app.genres.load_genres
menu.add_option('List all books', -> { app.list_all_books })
menu.add_option('List all Labels', -> { app.list_all_labels })
menu.add_option('List all Music Albums', -> { app.albums.list_all_albums })
menu.add_option('Create a Book', -> { app.add_book })
menu.add_option('Create a Music Album', -> { app.albums.add_album })
menu.add_option('Quit', -> { app.exit_app })
menu.show
