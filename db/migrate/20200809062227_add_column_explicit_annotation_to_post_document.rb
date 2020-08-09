class AddColumnExplicitAnnotationToPostDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :post_document, :explicit_annotation, :json
  end
end
