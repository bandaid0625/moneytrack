class CreateSpendings < ActiveRecord::Migration[6.0]
  def change
    create_table :spendings do |t|
      t.datetime   :start_time,    null: false
      t.integer    :spending_price,  null: false
      t.text       :memo
      t.string     :category,      null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
