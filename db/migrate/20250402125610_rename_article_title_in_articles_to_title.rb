class RenameArticleTitleInArticlesToTitle < ActiveRecord::Migration[7.1]
  def change
    rename_column :articles, :article_title, :title
  end
end
