class ChangeDataTypeOfTitle < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :title, :string
  end
end
