class CreateHeros < ActiveRecord::Migration[7.0]
  def change
    create_table :heros do |t|
      t.integer :id_hero
      t.string :name
      t.text :other

      t.timestamps
    end
  end
end
