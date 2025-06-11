# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "🌱 Seeding database..."

User.destroy_all
Chat.destroy_all
Message.destroy_all

User.create!(
    first_name: 'Alan',
    last_name: 'Brito',
    email: 'abritos@miuandes.cl',
    password: '123456'
)

User.create!(
    first_name: 'Johny',
    last_name: 'Bravo',
    email: 'jbravop@miuandes.cl',
    password: '123456'
)

User.create!(
    first_name: 'Jimmy',
    last_name: 'Neutron',
    email: 'jneutron@miuandes.cl',
    password: '123456'
)

User.create!(
    first_name: 'Alan',
    last_name: 'Brito',
    email: 'abritos2@miuandes.cl',
    password: '123456'
)

User.create!(
    first_name: 'John',
    last_name: 'Onion',
    email: 'Johnonion24@mimail.com',
    password: '123456'
)

User.create!(
    first_name: 'Alan',
    last_name: 'Gaton',
    email: 'argaton@miuandes.cl',
    password: '123456'
)

User.create!(
    first_name: 'Roberto',
    last_name: 'Carlos',
    email: 'rocarlo@example.cl',
    password: '123456'
)

User.create!(
    first_name: 'Gaston',
    last_name: 'Retamales',
    email: 'gatamales@miuandes.cl',
    password: '123456'
)

User.create!(
    first_name: 'John',
    last_name: 'Yacombi',
    email: 'jcombi@gems.com',
    password: '123456',
    admin: true
)

User.create!(
    first_name: 'Totto',
    last_name: 'Johnson',
    email: 'totson@sharklasers.net',
    password: '123456'
)

Chat.create(
    sender_id: 1,
    receiver_id: 2
)

Chat.create(
    sender_id: 2,
    receiver_id: 3,
)

Chat.create(
    sender_id: 3,
    receiver_id: 4
)

Chat.create(
    sender_id: 4,
    receiver_id: 5
)

Chat.create(
    sender_id: 5,
    receiver_id: 6
)

Chat.create(
    sender_id: 6,
    receiver_id: 7
)

Chat.create(
    sender_id: 7,
    receiver_id: 8
)

Chat.create(
    sender_id: 8,
    receiver_id: 9
)

Chat.create(
    sender_id: 9,
    receiver_id: 10
)

Chat.create(
    sender_id: 10,
    receiver_id: 11
)


Message.create(
    chat_id: 1,
    user_id: 9,
    body: "Hola"
)

Message.create(
    chat_id: 1,
    user_id: 9,
    body: "Que tal"
)

Message.create(
    chat_id: 1,
    user_id: 9,
    body: "Hiciste la tarea de bases de datos?"
)

Message.create(
    chat_id: 2,
    user_id: 5,
    body: "Hello, how are you?"
)

Message.create(
    chat_id: 2,
    user_id: 5,
    body: "We are contacting you from Microsoft for a job interview"
)

Message.create(
    chat_id: 3,
    user_id: 8,
    body: "Hi"
)

Message.create(
    chat_id: 3,
    user_id: 8,
    body: "Today is the presentation for the project!!"
)

Message.create(
    chat_id: 4,
    user_id: 7,
    body: "Hijo, a que hora llegas hoy?"
)

Message.create(
    chat_id: 5,
    user_id: 11,
    body: "Hey! Loook!"
)

Message.create(
    chat_id: 5,
    user_id: 11,
    body: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
)
