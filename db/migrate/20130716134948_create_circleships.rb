class CreateCircleships < ActiveRecord::Migration
  def change
    create_table :circleships do |t|
      t.integer :circle_id
      t.integer :user_id

      t.timestamps
    end

    add_index :circleships, :circle_id
    add_index :circleships, :user_id
  end
end
