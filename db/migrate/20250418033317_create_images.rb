class CreateImages < ActiveRecord::Migration[7.2]
  def change
    # TODO: Agregar un modelo para el manejo de imágenes OpenGraph e implementar el procesamiento de imágenes con módulo .upload-image
    create_table :images do |t|
      t.string :file,       null: false, default: ""
      t.integer :width,     null: false, default: 0
      t.integer :height,    null: false, default: 0
      t.string :orientation,null: false, default: "landscape", comment: "landscape|portrait" # no se usa
      t.boolean :processed, default: false
      t.string :status,     null: false, default: "empty", comment: "empty|processing|ready"

      t.timestamps
    end
  end
end
