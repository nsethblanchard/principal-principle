class AddFavMovieToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :fav_movie, :string
  end
end
