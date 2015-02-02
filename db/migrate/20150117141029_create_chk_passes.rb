class CreateChkPasses < ActiveRecord::Migration
  def change
    create_table :chk_passes do |t|
	t.integer :user_id
	t.string :category_id
	t.string :venue1_id
	t.string :venue2_id
	t.string :venue3_id
	t.string :venue4_id
	t.string :venue5_id
      t.timestamps
    end
  end
end
