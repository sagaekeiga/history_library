class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.text :name
      t.integer :number

      t.timestamps
    end
  end
end
