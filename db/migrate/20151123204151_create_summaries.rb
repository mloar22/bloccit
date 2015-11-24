class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :public
      t.string :boolean

      t.timestamps null: false
    end
  end
end
