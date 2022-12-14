class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
