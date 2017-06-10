class CreateEras < ActiveRecord::Migration[5.0]
  def change
    create_table :eras do |t|
      t.string :name
      t.datetime :start
      t.datetime :closed
      t.text :description

      t.timestamps
    end
  end
end
