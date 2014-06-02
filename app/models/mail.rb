class Mail < ActiveRecord::Base
  has_many :mail_events, :dependent => :destroy
  belongs_to :user

  #function to show only particualr type of mail e.g. rfi request mail
  def get_mails_by_primary_tag(primary_tag = 'rfi')
    #TODO make a query to get all object having given primary_tag
  end

  #get all mails whose recipient is in recipient list of specified request mail e.g a rfi request mail
  def get_mails_by_secondary_tag(secondary_tag = 'rfi_id')
    #TODO
  end

  #get all response of particular recipient(user) to selected mail
  def get_all_response_of_user(mail)
    mail.mail_events
  end

  def get_recent_response_of_user(mail)
    #TODO query to get collections of response of recipient in descending order of timestamp then return first if collection is not empty
  end

end