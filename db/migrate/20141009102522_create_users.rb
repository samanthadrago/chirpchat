class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :username, :email, :secure_password

      t.timestamps
    end
  end
end
