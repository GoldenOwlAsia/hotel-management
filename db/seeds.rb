puts '--> Creating users...'
User.create(
  email: "thanhtruong1216@gmail.com",
  user_name: "Sophie",
  first_name: "Thanh",
  last_name: "Truong",
  password: "123456",
  password_confirmation: "123456"
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
  rent_type = [:hourly, :overnight].sample
  status = [:rent, :booked].sample
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, rent_type: rent_type, status: status, hotel: Hotel.first)
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, rent_type: rent_type, status: status, hotel: Hotel.second)
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
  rent_type = [''].sample
  status = [:available].sample
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, rent_type: rent_type, status: status, hotel: Hotel.first)
  Room.create!(room_number: room_number, floor_number: floor, room_type: room_type, rent_type: rent_type, status: status, hotel: Hotel.second)
end

puts '--> Creating roles...'
Role.create!(name: 'owner', hotel: Hotel.first, user: User.first)
Role.create!(name: 'staff', hotel: Hotel.first, user: User.second)
Role.create!(name: 'staff', hotel: Hotel.first, user: User.third)
Role.create!(name: 'owner', hotel: Hotel.second, user: User.fourth)
Role.create!(name: 'staff', hotel: Hotel.second, user: User.fifth)
