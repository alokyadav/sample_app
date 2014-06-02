namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_mails
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_mails
  users = User.all
  users.each do |user|
    recipient = user.email
    sender = "me@chronus.com"
    message_id = Faker::Lorem.characters(10)
    primary_tag = 'rfi'
    secondary_tag = 'rfi_156'
    subject = 'rfi request mail'
    user_id = user.id
    Mail.create!(
                  sender: sender,
                  recipient: recipient,
                  message_id: message_id,
                  primary_tag: primary_tag,
                  secondary_tag: secondary_tag,
                  subject: subject,
                  user_id: user_id
                  )
  end
end

def create_events
  mails = Mail.all
  mails.each do |mails|
    recipient = mail.recipient
    message_id = mail.message_id
    event_type = "opened"
    secondary_tag = mail.secondary_tag
    timestamp = Faker::Number.number(10)
    mails.mail_events.create!(
                                recipient: recipient,
                                message_id: message_id,
                                event_type: event_type,
                                secondary_tag: secondary_tag,
                                timestamp: timestamp
                              )
  end
end

# def make_mails
#   admin = User.create!(name:     "Example User",
#                        email:    "example@railstutorial.org",
#                        password: "foobar",
#                        password_confirmation: "foobar",
#                        admin: true)
#   99.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1}@railstutorial.org"
#     password  = "password"
#     User.create!(name:     name,
#                  email:    email,
#                  password: password,
#                  password_confirmation: password)
#   end
# end