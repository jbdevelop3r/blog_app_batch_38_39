class ChangeTitleName < ActiveRecord::Migration[7.1]
  def change
    rename_column :articles, :title, :article_title
  end
end
