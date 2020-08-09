class AddColumnActiveToPostDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :post_document, :active, :boolean
  end
end
