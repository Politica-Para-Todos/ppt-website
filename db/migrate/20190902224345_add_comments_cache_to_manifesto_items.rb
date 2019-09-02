class AddCommentsCacheToManifestoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :manifesto_items, :comments_count, :integer
  end
end
