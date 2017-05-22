class AddPayerIdColumnToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :payer_id, :integer
  end
end
