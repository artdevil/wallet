class CreateWithdraws < ActiveRecord::Migration[7.0]
  def change
    create_table :withdraws do |t|
      t.references :owner, polymorphic: true, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
