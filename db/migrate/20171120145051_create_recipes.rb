class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title, presence: true
      t.text :instructions, presence: true

      t.timestamps
    end
  end
end
