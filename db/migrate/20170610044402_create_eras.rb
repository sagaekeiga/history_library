class CreateEras < ActiveRecord::Migration[5.0]
  def change
    create_table :eras do |t|
      t.string :name
      t.datetime :start
      t.datetime :closed
      t.string :description

      t.timestamps
    end
  end
end
