class RemoveColumnsFromCsvsTable < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :csvs, :path
    remove_column :csvs, :name
  end
end
