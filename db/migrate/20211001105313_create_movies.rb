class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :time
      t.text :memo
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :movies, [:user_id, :created_at]
  end
end
