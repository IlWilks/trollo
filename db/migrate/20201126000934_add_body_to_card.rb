class AddBodyToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :body, :string
  end
end
