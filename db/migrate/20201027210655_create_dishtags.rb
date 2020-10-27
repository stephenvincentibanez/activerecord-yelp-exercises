class CreateDishtags < ActiveRecord::Migration[5.2]
  def change
    create_table :dishtags do |t|
      t.integer :dish_id
      t.integer :tag_id
    end
  end
end
