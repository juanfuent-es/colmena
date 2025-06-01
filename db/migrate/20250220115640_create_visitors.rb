class CreateVisitors < ActiveRecord::Migration[7.0]
  def change
    create_table :visitors do |t|
      t.string :location,	null: false, default: ""
      t.string :ip,			null: false, default: ""
      t.index :ip
    end

    create_table :visits do |t|
  		t.references :visitable,  null: false, polymorphic: true
  		t.references :visitor,    null: false, foreign_key: true
  		t.integer :counter, 		  null: false, default: 0
    end

  end
end