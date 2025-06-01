class CreatePrograms < ActiveRecord::Migration[7.2]

  def change

    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :programs do |t|
      t.string :name, default: "", null: false
      t.integer :number, default: 0, null: false
      t.integer :total_views,    null: false, default: 0
      t.text :description
      t.integer :year, default: Date.today.year, null: false
      t.string :school, default: ""
      t.string :url, default: ""
    end

    create_table :themes do |t|
      t.references :program, null: false, foreign_key: true
      t.string :title, default: "", null: false
      t.integer :number, default: 0, null: false
      t.text :description
      t.text :activity

      t.timestamps
    end

    create_table :topics do |t|
      t.references :theme, null: false, foreign_key: true
      t.integer :number, default: 0, null: false
      t.string :title, default: "", null: false
      t.integer :estimated_time, default: 0
      t.string :content_type, default: ""
      t.text :presentation
      t.text :objective
      t.text :exercises
      t.text :homework
      t.text :comments
      t.text :reference_material
      t.text :credits_and_sources

      t.timestamps
    end
  
    create_table :blocks do |t|
      #
      t.integer :number,    null: false, default: 0
      t.string :block_type, null: false, default: ""
      #
      t.references :blockable,  null: false, polymorphic: true
      t.references :image,  null: true, foreign_key: true
      #
      t.string :title,      null: false, default: ""
      t.string :description, default: ""
      t.text :content
  
      t.timestamps
    end

  end
  
end
