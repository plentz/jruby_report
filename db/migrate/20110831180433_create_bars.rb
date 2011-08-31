class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name

      t.timestamps
    end
  end
end
