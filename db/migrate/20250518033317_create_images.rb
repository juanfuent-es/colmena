class CreateImages < ActiveRecord::Migration[7.2]
  def change
    # images optimizadas para frontend, jpg, webp
    # no hace falta guardar la extensión, ya quet todas se procesan en jpg y webp
    create_table :images, id: :uuid do |t|
      t.string :file,       null: false, default: ""
      #
      t.integer :width,     null: false, default: 0
      t.integer :height,    null: false, default: 0
      t.string :orientation,null: false, default: "landscape", comment: "landscape|portrait"
      t.boolean :processed, default: false
      t.string :status,     null: false, default: "empty", comment: "empty|processing|ready"

      t.timestamps
    end
  end
end
