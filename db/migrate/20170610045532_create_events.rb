class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :season
      t.string :url
      t.string :description
      t.string :era
      t.string :character
      
      t.timestamps
    end
  end
end
