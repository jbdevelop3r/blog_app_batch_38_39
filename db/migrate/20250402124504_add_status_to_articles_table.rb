class AddStatusToArticlesTable < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :string, default: 'Published'
  end
end
