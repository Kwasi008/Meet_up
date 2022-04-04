class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :role
      t.references :user, forign_key: :true
      t.references :group, forign_key: :true

      t.timestamps
    end
  end
end
