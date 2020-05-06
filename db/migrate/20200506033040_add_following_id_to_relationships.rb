class AddFollowingIdToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :following_id, :integer
  end
end
