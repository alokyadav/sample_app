class CreateMailEvents < ActiveRecord::Migration
  def change
    create_table :mail_events do |t|
      t.string :recipient
      t.string :secondary_tag
      t.string :event_type
      t.float  :timestamp
      t.integer :mail_id
    end
  end
end
