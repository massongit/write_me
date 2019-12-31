class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :product_name, null: false
      t.text :description
      t.string :repository_url, null: false
      t.boolean :is_completed, default: false, null: false

      t.timestamps
    end
  end
end
