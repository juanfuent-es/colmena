class CreateQuotations < ActiveRecord::Migration[7.2]
  def change

    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :quotations, id: :uuid do |t|
      t.string :client,       default: "", null: false
      t.string :project,      default: ""
      t.string :title,        default: "", null: false
      t.string :subject,      default: ""
      t.string :detail,       default: "", null: false
      t.integer :weeks,       default: 0
      t.integer :total_number,default: 0
      t.string :total_string, default: ""
      t.string :currency,     default: "MXN"

      t.timestamps
    end
  end
end
