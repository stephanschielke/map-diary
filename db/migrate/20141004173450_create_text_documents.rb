class CreateTextDocuments < ActiveRecord::Migration
  def change
    create_table :text_documents do |t|
      t.string :filename
      t.string :content_type
      t.text :file_contents

      t.timestamps
    end
  end
end
