class CreateQuotations < ActiveRecord::Migration[7.2]
  def change

    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :quotations do |t|
      t.string :client,       default: "", null: false
      t.string :logo,         default: "", null: false
      t.string :project,      default: ""
      t.string :description,  default: ""
      t.string :title,        default: ""
      t.string :slug,         default: ""
      t.string :footer,       default: ""
      t.integer :weeks,       default: 0
      t.integer :total,       default: 0

      t.timestamps
    end
  end
end
