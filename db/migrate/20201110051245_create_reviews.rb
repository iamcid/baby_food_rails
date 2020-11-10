class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :thumbs_up
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :baby_food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
