class CreateBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table :blocks do |t|
      #
      t.integer :number,    null: false, default: 0
      t.string :block_type, null: false, default: ""
      #
      t.references :topic,  null: false, foreign_key: true, type: :uuid
      t.references :image,  null: true, foreign_key: true, type: :uuid
      #
      t.string :title,      null: false, default: ""
      t.text :description

      t.timestamps
    end
  end
end
