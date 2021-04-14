class CreateClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :clicks do |t|
      t.belongs_to :user
      t.integer :click_count
      t.timestamps
    end
  end
end
