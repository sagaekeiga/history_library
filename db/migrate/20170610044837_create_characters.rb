class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :life
      t.string :url
      t.text :description
      t.string :era
      t.string :event
      
      t.timestamps
    end
  end
end
