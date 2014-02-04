class SetPostVisibilityBooleanToFalse < ActiveRecord::Migration
  def change
    change_column :posts, :visible, :boolean, :default => false
  end
end
