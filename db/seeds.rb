User.create(name: "Serena", email: "s@e.com", password: "123", password_confirmation: "123")
User.create(name: "Jason", email: "j@t.com", password: "123", password_confirmation: "123")
User.create(name: "Chelsea", email: "c@t.com", password: "123", password_confirmation: "123")


Messages.create(details: "Party", amount: 30, user_id: 1)
Splitters.create(user_id: 2, amountOwing: 15, message_id: 1)
Splitters.create(user_id: 3, amountOwing: 15, message_id: 1)

User.where(api_token: nil).each {|u| u.update(api_token: SecureRandom.urlsafe_base64(32)) }
