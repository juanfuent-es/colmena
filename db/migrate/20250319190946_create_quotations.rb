class CreateQuotations < ActiveRecord::Migration[7.2]
  def change
    create_table :quotations do |t|
      t.string :client
      t.string :logo
      t.string :project
      t.string :description
      t.string :title
      t.string :slug
      t.string :footer
      t.integer :weeks
      t.integer :total

      t.timestamps
    end
  end
end
