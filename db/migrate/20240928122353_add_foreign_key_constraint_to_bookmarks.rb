class AddForeignKeyConstraintToBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
