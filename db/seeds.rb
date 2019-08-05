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
  {number: '01', floor: 0, price: 300000},
  {number: '02', floor: 0, price: 301000},
  {number: '03', floor: 0, price: 302000},
  {number: '04', floor: 0, price: 303000},
  {number: '05', floor: 0, price: 304000},
  {number: '06', floor: 0, price: 305000},
  {number: '07', floor: 0, price: 306000},
  {number: '120', floor: 1, price: 307000},
  {number: '121', floor: 1, price: 308000},
  {number: '122', floor: 1, price: 309000},
  {number: '123', floor: 1, price: 310000},
  {number: '124', floor: 1, price: 311000},
  {number: '125', floor: 1, price: 312000},
  {number: '126', floor: 1, price: 313000},
  {number: '127', floor: 1, price: 314000},
  {number: '201', floor: 2, price: 315000},
  {number: '202', floor: 2, price: 316000},
  {number: '203', floor: 2, price: 317000},
  {number: '206', floor: 2, price: 318000},
  {number: '207', floor: 2, price: 319000},
  {number: '208', floor: 2, price: 320000},
  {number: '210', floor: 2, price: 321000},
  {number: '301', floor: 3, price: 322000},
  {number: '302', floor: 3, price: 323000},
  {number: '303', floor: 3, price: 324000},
  {number: '306', floor: 3, price: 325000},
  {number: '307', floor: 3, price: 326000},
  {number: '308', floor: 3, price: 327000},
  {number: '310', floor: 3, price: 328000}
].each do |room_position|
  floor = room_position[:floor]
  room_number = room_position[:number]
  price = room_position[:price]
  room_type = [:single, :double, :queen].sample
  Room.create!(room_number: room_number, price: price, floor_number: floor, room_type: room_type, hotel: Hotel.first)
  Room.create!(room_number: room_number, price: price, floor_number: floor, room_type: room_type, hotel: Hotel.second)
end

[
  {number: '104', floor: 1, price: 329000},
  {number: '105', floor: 1, price: 340000},
  {number: '111', floor: 1, price: 341000},
  {number: '204', floor: 2, price: 342000},
  {number: '205', floor: 2, price: 343000},
  {number: '211', floor: 2, price: 344000},
  {number: '304', floor: 3, price: 345000},
  {number: '305', floor: 3, price: 346000},
  {number: '311', floor: 3, price: 347000}
].each do |room_position|
  floor = room_position[:floor]
  room_number = room_position[:number]
  price = room_position[:price]
  room_type = [:single, :double, :queen].sample
  Room.create!(room_number: room_number, price: price, floor_number: floor, room_type: room_type, hotel: Hotel.first)
  Room.create!(room_number: room_number, price: price, floor_number: floor, room_type: room_type, hotel: Hotel.second)
end

puts '--> Creating customers'
20.times do |n|
  name = Faker::Name.name
  phone_number = Faker::Number.number(10)
  customer_nin = Faker::Number.number(9)
  Customer.create!(name: name, phone_number: phone_number, customer_nin: customer_nin)
end

puts '--> Creating bookings'
Booking.create!(room: Room.first, order: Order.first, customer: Customer.first, price: Room.first.price, checkin_time: Time.now, checkout_time: 1.day.from_now, rent_type:'overnight', status: 'checked_in')
Booking.create!(room: Room.second, customer: Customer.second, price: Room.second.price, checkin_time: Time.now, checkout_time: 1.day.from_now, rent_type:'hourly', status: 'checked_in')
Booking.create!(room: Room.third, customer: Customer.third, price: Room.third.price, checkin_time: Time.now, checkout_time: 1.day.from_now, rent_type:'overnight', status: 'checked_in')
Booking.create!(room: Room.fourth, customer: Customer.fourth, price: Room.fourth.price, checkin_time: 1.month.ago, checkout_time: 1.month.from_now, rent_type:'hourly', status: 'checked_in')

puts '--> Creating orders'
Order.create(customer: Customer.first, order_date: Time.now, total: Booking.first.price, paid: 0, payment_method: 'cash')

puts '--> Creating guests'
Guest.create!(booking: Booking.first, guest_type: 'women', quantity: 1)
Guest.create!(booking: Booking.first, guest_type: 'men', quantity: 1)
Guest.create!(booking: Booking.first, guest_type: 'baby_girl', quantity: 1)
Guest.create!(booking: Booking.first, guest_type: 'baby_boy', quantity: 1)
Guest.create!(booking: Booking.second, guest_type: 'men', quantity: 2)
Guest.create!(booking: Booking.second, guest_type: 'baby_boy', quantity: 1)

puts '--> Creating services'
Service.create!(name: 'Coca', price: '10000')
Service.create!(name: 'Sting', price: '20000')
Service.create!(name: 'Pepsi', price: '15000')
Service.create!(name: 'Aquafina', price: '5000')
Service.create!(name: 'Coffee', price: '30000')

puts '--> Creating roles...'
Role.create!(name: 'owner', hotel: Hotel.first, user: User.first)
Role.create!(name: 'staff', hotel: Hotel.first, user: User.second)
Role.create!(name: 'staff', hotel: Hotel.first, user: User.third)
Role.create!(name: 'owner', hotel: Hotel.second, user: User.fourth)
Role.create!(name: 'staff', hotel: Hotel.second, user: User.fifth)
