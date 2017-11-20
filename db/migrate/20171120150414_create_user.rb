class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, presence: true
      t.string :display_name
      t.string :encrypted_password

      t.timestamps
    end
  end
end
