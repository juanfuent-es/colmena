class CreatePages < ActiveRecord::Migration[7.0]
  
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :pages, id: :uuid do |t|

      t.string :slug,            null: false, default: ""
      t.string :title,           null: false, default: ""
      t.string :synopsis,        null: false, default: ""
      t.string :cover,           default: "", comment: "La misma imagen se ocupará de metadata"
      t.string :category,        null: false, default: "", comment: "Static | Blog | Article | Tutorial | Course | Workshop"
      t.string :keywords,        default: ""
      
      t.text :content
      
      # OG_metadata

      t.boolean :published,      default: false, comment: "draft or published"
      t.boolean :restricted,     default: false, comment: "For static pages. e.g. Home, About, Contact, ..."
      
      t.references :user,        null: true, foreign_key: true, type: :uuid
      
      t.timestamps
    end

    create_table :blocks do |t|
      t.integer :position,  null: false, default: 0
      t.references :page,   null: false, foreign_key: true, type: :uuid
      #
      t.string :block_type, null: false, default: "", comment: "text | image | video | code"
      t.string :language,   null: true, default: "", comment: "For code blocks: ruby | python | javascript | etc."
      #
      t.references :image,  null: true, foreign_key: true, type: :uuid
      #
      t.string :title,      null: false, default: ""
      t.text :content
  
      t.timestamps
    end

  end

end