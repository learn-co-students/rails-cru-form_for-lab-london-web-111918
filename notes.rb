=begin

BLOG

Rails Express

1 - Deliverables
    # Be clear about the final deliverable
      # Eg
        - Build a Song App which allows the users to add songs
        - Each song belongs to a Artist and Genre.
        - Artist and Genre can have many songs.
        - Each model with have a form
        - for the song `show` page display song's genre and artist
        - link to the respective genre and artist `show` pages.
        - `create`, `update`, and `show` for each model

    # Note any specific tips or conditions
      Eg
        - You will need to use [strong params]
        (https://github.com/learn-co-curriculum/strong-params-basics)
        - You can use the `resource`, `model`, `migration`, and `controller` generators, but do not use the `scaffold` generator
        - *Top Tip: Remember to use the --no-test-framework flag when generating models and controllers to avoid generating unnecessary testing frameworks!*

2 - Draw out the relationships on paper
      - note class names + attributes + relationships

3 - Write seed data
      - eg

      # Artists
      Artist.destroy_all
      eminem = Artist.create(name: "Eminem", bio: "American rapper, record producer and actor Eminem was born Marshall Bruce Mathers III on October 17, 1972, in St. Joseph, Missouri. He never knew his father, Marshall Mathers Jr., who abandoned the family when Eminem was still an infant and rebuffed all of his son's many attempts to contact him during his childhood.")
      sade = Artist.create(name: "Sade", bio: "Helen Folasade Adu, CBE, known professionally as Sade Adu or simply Sade, is a British Nigerian singer, songwriter, and actress.")
      skepta = Artist.create(name: "Skepta", bio: "Joseph Junior Adenuga, better known by his stage name Skepta, is an English rapper, songwriter, record producer and music video director from Tottenham, North London")
      marvin_gaye = Artist.create(name: "Marvin Gaye", bio: "Marvin Pentz Gaye was an American singer, songwriter and record producer. Gaye helped to shape the sound of Motown in the 1960s, first as an in-house session player and later as a solo artist")

      #Genres
      Genre.destroy_all
      soul = Genre.create(name: "Soul")
      grime = Genre.create(name: "Grime")
      rap = Genre.create(name: "Rap")

      #Songs
      Song.destroy_all
      Song.create(name: "My Name Is", artist: eminem, genre: rap)
      Song.create(name: "Lucky You", artist: eminem, genre: rap)
      Song.create(name: "What's Going On?", artist: marvin_gaye, genre: soul)
      Song.create(name: "Got To Give It Up", artist: marvin_gaye, genre: soul)
      Song.create(name: "Pure Water", artist: skepta, genre: grime)
      Song.create(name: "That's Not Me", artist: skepta, genre: grime)

      Can also be done like this but not as rail
      # Song.create(name: "My name is", artist_id: 1, genre_id: 3)
      # Song.create(name: "My name is", artist_id: eminem.id, genre_id: rap.id )

4 - Generate Models and run Migration
      https://guides.rubyonrails.org/active_record_migrations.html
      One line per model:
      Run the commands in BASH!!!!!!!
      MODEL

      rails g model artist name bio --no-test-framework
      rails g model genre name --no-test-framework
      rails g model song name artist_id:integer genre_id:integer --no-test-framework

      rake db:migrate

      checks:
        check rake console for 'migrated' feedback
        check db/schema.rb for confirmation
        rake c > Song.all should return an empty array from ActiveRecord


5 - Set the Associations
  eg


  class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
  end

  class Genre < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
  end

  class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
  end


6 - Seed the data and run Active Record checks
      - rake db:seed
      - check the database is populated
      - rake c > Song.all should return an array of artists from ActiveRecord
      -
      Check Songs know about Genres
      - Song.first.genre => #<Genre id: 9, name: "Rap", created_at: "2018-12-18 16:09:28", updated_at: "2018-12-18 16:09:28">

      Check Songs know about Genres
      - Genre.last.songs => #<ActiveRecord::Associations::CollectionProxy [#<Song id: 22, name: "My Name Is", artist_id: 21, genre_id: 18, created_at: "2018-12-18 16:30:18", updated_at: "2018-12-18 16:30:18">, #<Song id: 23, name: "Lucky You", artist_id: 21, genre_id: 18, created_at: "2018-12-18 16:30:18", updated_at: "2018-12-18 16:30:18">]>
      - Genre.all[2].songs =>

      Check Song tables
      - Song.all

7 - Generate Routes file & Controllers & Views (create, update, show)
      - in BASH type the following:
      MAKE SURE THE CONTROLLER IS PLURAL!!!!!

        rails g controller artists create update show --no-test-framework
        rails g controller genres create update show --no-test-framework
        rails g controller songs create update show --no-test-framework

8 - Build Controller Methods

    Three methods required: show, create, update

    class ArtistController < ApplicationController
      before_action :find_artist, only: [:show, :edit, :update]
      #the 'find_artist' method defined in Private keeps code dry and can only be used for methods specified.

      def show
        find_artist
      end

      def create
        @artist = Artist.create(artist_params)
      end

      def update
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
      end

      private

        def find_artist
          @artist = Artist.find(params[:id])
        end

        def artist_params # restricts the arguments accepted
          params.require(:artist).permit(:name, :bio)
        end

    end

9 - Build Router Methods





Form

>>> The form fields create an OUTPUT which is an INPUT for our method in the Controller
>>> The form has a actions '/dogs' and a method 'POST'.     The input field populates an attribute of the params hash
    <input id="name" type="text" name="dog[name]" />

    so params will look like this     params {
                                          dog: {
                                          name: 'fido',
                                          age: 3
                                        }
                                      }

RESTFUL ROUTING


NEW and CREATE are paired together
  New GETS the empty form
  Create POSTS the data and performs the action of creating a Dog.

  new responds to the route /dogs/new and has a GET html method.
  The router responds to the Action/Method request and call the 'new' method and retreive the new view.
  The new view contains a form.
  The form field data will generate the output which generates the params hash
  The form also has an Action '/dogs' and method='POST'. This is convention and will be important will buiding the controller.

  create is an action /dogs on the form
  The controller method will create the new dog with the params hash values.
  We store the params hash in a variable on the controller. So we can call it when we redirect to the show page '/dogs/#{dogs.id}' (or dogs in rails.)
  It will also redirect the user to show the dog using the 'show' GET method.
  Create DOES NOT have an erb template it is just a POST method. It is a backend task.
  You have to manually send the user somewhere else.

  >> Put a byebug binding in and check 'params' values are correct.

SHOW
   >>> Should always be ordered after a create GET to avoid the 'new' in dogs/new being mistaken for an id in  dogs/:id
   a show looks like this:

   get "/dogs/:id" do
     @dog = Dog.find(params[:id])
   end

EDIT & UPDATE are paired together.
  They perform the same action as NEW & CREATE except EDIT prepopulates form data and UPDATE updates the date in active record existing objects.

DESTORY
  reacts to the http verb 'DELETE' it points to a id "/dogs/:id"

  delete "/dogs/:id" do
    dog = Dog.find(params[:id])
    dog.destroy
    redirect "/dogs"
  end

  PATCH/DELETE request cannot be sent from the browser by default.
  us the 'use Rack::MethodOverride' in the config.ru file

  There is aslo some special syntax in the delete form.e
  it Includes a form action '/dogs/' the dog.id and a method POST with a 'hidden' method called '_method' and a value 'delete'




  What's different?

  Making a model the old way: 3 steps the new way: rails g model ????

  Routing the old way: route in your controller the new way: routes.rb

  View naming the old way: *.erb the new way: *.html.erb

  Links on pages the old way: annoying tags the new way: link_to

  Path helpers the old way: there are none the new way: rails/rake routes

  template rendering only when needed, its implicit
DHH, rework, 37signals and basecamp
get /"trains", to: "trains#index"   vs  resources :trains, only: [:index, :show]
rails server
no more annoying /route/ error

LINK HELPERS! link_to <what to show> <where to link to>
  no need to creat a href and interpolate ids
  <href="/trains/"<% train.id %>"> <%= train.name %>
  rails uses link_to and a helper method
  <%= link_to train.name, train %>
   The first argument 'train.name' is what the link will say
   the second 'train' is where it will go to which is implicitly 'train.id'

   <h1>trains index.html.erb View</h1>

<% @trains.each do |train| %>
 <p>
   <%= link_to train.name, train %>
   costs
   <%= train.price %>
   and it is
   <% if train.cool %>
     cool
   <% else %>
     <span style="color: red;"> not cool </span>
   <% end %>
 </p>
<% end %>


PATH HELPERS!
rails routes
link_to trains_path
`to 'trans#show', as: 'train'
rails routes app.train_path(1)
guides.rubyonrails.org









=end
