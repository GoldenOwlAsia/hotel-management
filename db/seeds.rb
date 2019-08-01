puts '--> Creating users...'
User.create(
  email: 'goldenowl2019@gmail.com',
  user_name: 'Sophie',
  first_name: 'Thanh',
  last_name: 'Truong',
  password: '123456',
  password_confirmation: '123456'
)

10.times do |n|
  email = Faker::Internet.email
  user_name = Faker::Artist.name
  first_name = Faker::Artist.name
  last_name = Faker::Name.name
  password =  "123456"
  unless User.exists?(user_name: user_name)
    new_user = User.new(
      email: email,
      user_name: user_name,
      first_name: first_name,
      last_name: last_name,
      password: password,
      password_confirmation: password
    )
    new_user.save
  end
end

puts '--> Creating hotels...'
2.times do |n|
  address = Faker::Address.full_address
  name = Faker::Games::Pokemon.name
  Hotel.create!(name: name, address: address)
end

puts '--> Creating rooms...'
[
  {number: '01', floor: 0},
  {number: '02', floor: 0},
  {number: '03', floor: 0},
  {number: '04', floor: 0},
  {number: '05', floor: 0},
  {number: '06', floor: 0},
  {number: '07', floor: 0},
  {number: '120', floor: 1},
  {number: '121', floor: 1},
  {number: '122', floor: 1},
  {number: '123', floor: 1},
  {number: '124', floor: 1},
  {number: '125', floor: 1},
  {number: '126', floor: 1},
  {number: '127', floor: 1},
  {number: '201', floor: 2},
  {number: '202', floor: 2},
  {number: '203', floor: 2},
  {number: '206', floor: 2},
  {number: '207', floor: 2},
  {number: '208', floor: 2},
  {number: '210', floor: 2},
  {number: '301', floor: 3},
  {number: '302', floor: 3},
  {number: '303', floor: 3},
  {number: '306', floor: 3},
  {number: '307', floor: 3},
  {number: '308', floor: 3},
  {number: '310', floor: 3},
].each do |room_position|
  floor = room_position[:floor]
  room_number = room_position[:number]
  room_type = [:single, :double, :queen].sample
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, hotel: Hotel.first)
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, hotel: Hotel.second)
end

[
  {number: '104', floor: 1},
  {number: '105', floor: 1},
  {number: '111', floor: 1},
  {number: '204', floor: 2},
  {number: '205', floor: 2},
  {number: '211', floor: 2},
  {number: '304', floor: 3},
  {number: '305', floor: 3},
  {number: '311', floor: 3},
].each do |room_position|
  floor = room_position[:floor]
  room_number = room_position[:number]
  room_type = [:single, :double, :queen].sample
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, hotel: Hotel.first)
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, hotel: Hotel.second)
end

puts '--> Creating customers'
20.times do |n|
  name = Faker::Name.name
  phone_number = Faker::Number.number(10)
  customer_nin = Faker::Number.number(9)
  Customer.create!(name: name, phone_number: phone_number, customer_nin: customer_nin)
end

puts '--> Creating bookings'
Booking.create!(room: Room.first, customer: Customer.first, checkin_time: Time.now, checkout_time: 1.day.from_now, rent_type:'overnight', status: 'checked_in')
Booking.create!(room: Room.second, customer: Customer.second, checkin_time: Time.now, checkout_time: 1.day.from_now, rent_type:'hourly', status: 'checked_in')
Booking.create!(room: Room.third, customer: Customer.third, checkin_time: Time.now, checkout_time: 1.day.from_now, rent_type:'overnight', status: 'checked_in')
Booking.create!(room: Room.fourth, customer: Customer.fourth, checkin_time: 1.month.ago, checkout_time: 1.month.from_now, rent_type:'hourly', status: 'checked_in')

puts '--> Creating guests'
Guest.create!(booking: Booking.first, guest_type: 'women', quantity: 1)
Guest.create!(booking: Booking.first, guest_type: 'men', quantity: 1)
Guest.create!(booking: Booking.first, guest_type: 'baby_girl', quantity: 1)
Guest.create!(booking: Booking.first, guest_type: 'baby_boy', quantity: 1)
Guest.create!(booking: Booking.second, guest_type: 'men', quantity: 2)
Guest.create!(booking: Booking.second, guest_type: 'baby_boy', quantity: 1)

puts '--> Creating roles...'
Role.create!(name: 'owner', hotel: Hotel.first, user: User.first)
Role.create!(name: 'staff', hotel: Hotel.first, user: User.second)
Role.create!(name: 'staff', hotel: Hotel.first, user: User.third)
Role.create!(name: 'owner', hotel: Hotel.second, user: User.fourth)
Role.create!(name: 'staff', hotel: Hotel.second, user: User.fifth)
