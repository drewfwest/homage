class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |col|
      col.string :title
      col.text :content

      col.timestamps
    end
  end
end
