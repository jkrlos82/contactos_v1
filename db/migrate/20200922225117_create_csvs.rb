class CreateCsvs < ActiveRecord::Migration[6.0]
  def change
    create_table :csvs do |t|
      t.text :path
      t.text :name
      t.text :status
      t.timestamps
    end
  end
end
