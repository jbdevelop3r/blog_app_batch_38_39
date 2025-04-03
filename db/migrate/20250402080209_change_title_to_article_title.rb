class ChangeTitleToArticleTitle < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :title, 'numeric USING CAST(title AS numeric)'
  end
end
