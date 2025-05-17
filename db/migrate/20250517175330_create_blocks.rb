class CreateBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table :blocks do |t|
      t.string :title
      t.integer :number
      t.string :block_type
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
