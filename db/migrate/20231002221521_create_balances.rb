class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.references :owner, polymorphic: true, null: false
      t.references :reference, polymorphic: true, null: true
      t.decimal :amount, null: false
      t.string :balance_type, null: false

      t.timestamps
    end
  end
end
