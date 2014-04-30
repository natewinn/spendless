class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string  :transaction_type
      t.integer :amount
      t.string  :name
      t.string  :category
      t.integer :account_id
    end
  end
end
