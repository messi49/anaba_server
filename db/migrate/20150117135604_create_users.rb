class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	t.integer :user_id
	t.string :category_id
	t.string :venue_id
      t.timestamps
    end
  end
end
