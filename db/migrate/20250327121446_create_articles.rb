class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :is_published, default: false

      t.timestamps
    end
  end
end
