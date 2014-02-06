class RemoveAndAddUpdatedIndexToPosts < ActiveRecord::Migration
  def change
    remove_index :posts, :slug
    add_index :posts, :slug, unique: true
  end
end
