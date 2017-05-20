class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :details
      t.integer :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
