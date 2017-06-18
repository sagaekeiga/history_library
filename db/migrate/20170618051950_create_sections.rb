class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.text :name
      t.integer :number

      t.timestamps
    end
  end
end
