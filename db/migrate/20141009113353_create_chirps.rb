class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.string :content
      t.references :user

      t.timestamps
    end
  end
end
