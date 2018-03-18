class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :requestor
      t.string :target

      t.timestamps
    end
  end
end
