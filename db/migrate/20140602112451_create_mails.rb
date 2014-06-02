class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :sender
      t.string :recipient
      t.string :message_id
      t.string :primary_tag
      t.string :secondary_tag
      t.text   :subject
      t.integer :user_id
    end
  end

end
