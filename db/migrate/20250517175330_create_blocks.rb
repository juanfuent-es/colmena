class CreateBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table :blocks do |t|
      t.references :topic,  null: false, foreign_key: true, type: :uuid
      t.string :title,      null: false, default: ""
      t.integer :number,    null: false, default: 0
      t.string :block_type, null: false, default: ""
      t.string :image,      default: ""
      t.text :description

      t.timestamps
    end
  end
end
