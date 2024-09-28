class AddDetailsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :tmdb_id, :integer
    add_column :movies, :genres_ids, :text
    add_column :movies, :release_date, :date
    add_column :movies, :vote_count, :integer
  end
end
