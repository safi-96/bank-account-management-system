class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, index: true, unique: true
      t.references :bank, foreign_key: true

      t.timestamps
    end
  end
end
