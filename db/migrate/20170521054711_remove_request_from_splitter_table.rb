class RemoveRequestFromSplitterTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :splitters, :request, :boolean
  end
end
