class CreateDeposits < ActiveRecord::Migration[7.0]
  def change
    create_table :deposits do |t|
      t.references :owner, polymorphic: true, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
