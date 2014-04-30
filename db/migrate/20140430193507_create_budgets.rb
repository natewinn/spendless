class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :limit
      t.date    :start_date
      t.date    :end_date
      t.integer :user_id
    end
  end
end
