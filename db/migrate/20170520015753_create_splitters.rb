class CreateSplitters < ActiveRecord::Migration[5.0]
  def change
    create_table :splitters do |t|
      t.boolean :request
      t.references :user, foreign_key: true
      t.integer :amountOwing
      t.boolean :paid
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
