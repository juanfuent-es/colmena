class CreateQuotations < ActiveRecord::Migration[7.2]
  def change

    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :quotations, id: :uuid do |t|
      t.string :client,       default: "", null: false
      t.string :logo,         default: "", null: false
      t.string :project,      default: ""
      t.string :description,  default: ""
      t.string :title,        default: ""
      t.string :slug,         default: ""
      t.string :footer,       default: ""
      t.integer :weeks
      t.integer :total

      t.timestamps
    end
  end
end
