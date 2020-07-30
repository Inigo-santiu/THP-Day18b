class CreateDogsitters < ActiveRecord::Migration[5.2]
  def change
    create_table :dogsitters do |t|
      t.string :name
      t.string :dogwalking_style
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end