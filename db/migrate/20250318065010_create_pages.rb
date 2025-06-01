class CreatePages < ActiveRecord::Migration[7.0]
  
  def change
    
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :pages do |t|
      t.integer :total_views,    null: false, default: 0
      t.integer :number,         null: false, default: 0
      t.string :lang,            null: false, default: "es"
      t.string :slug,            null: false, default: ""
      t.string :category,        null: false, default: "", comment: "Static | Blog | Article | Tutorial | Course | Workshop"
      
      t.string :title,           null: false, default: ""
      t.text :content
      
      # OG_metadata
      t.string :og_title,        null: false, default: ""
      t.string :og_description,  null: false, default: ""
      t.string :og_image,        default: ""
      t.string :keywords,        default: ""
      
      t.boolean :published,      default: true, comment: "For static pages. e.g. Home, About, Contact, ..."
      t.boolean :restricted,     default: false, comment: "For static pages. e.g. Home, About, Contact, ..."
      t.references :user,        null: true, foreign_key: true
      
      t.timestamps
    end

  end

end