class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.text :kind
      t.text :name
      t.text :url
      t.text :image
      t.text :description
      t.text :chapter
      t.text :section
      t.text :year

      t.timestamps
    end
  end
end
