class AddUserIdToCsvs < ActiveRecord::Migration[6.0]
  def change
    add_column :csvs, :user_id, :integer
  end
end
