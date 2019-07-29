describe AvailableRoomsQuery do
  let(:hotel) { create(:hotel) }
  let(:service) { AvailableRoomsQuery.new(hotel.id) }
  let!(:room_1) { create(:room, hotel: hotel) }
  let!(:room_2) { create(:room, hotel: hotel) }

  context 'no rooms booked' do
    it 'returns available rooms' do
      expect(service.execute(Time.current, 1.day.from_now)).to eq([room_1, room_2])
    end
  end

  context 'a room booked' do
    let!(:booking) { create(:booking, room: room_1, checkin_time: 2.day.ago, checkout_time: 1.days.ago) }
    it 'returns available rooms' do
      expect(service.execute(Time.current, 1.day.from_now)).to eq([room_1, room_2])
    end
  end

  context 'a room booked' do
    let!(:booking) { create(:booking, room: room_1, checkin_time: 2.day.from_now, checkout_time: 3.day.from_now) }
    it 'returns available rooms' do
      expect(service.execute(Time.current, 1.day.from_now)).to eq([room_1, room_2])
    end
  end

  context 'a room booked' do
    let!(:booking) { create(:booking, room: room_1, checkin_time: 1.day.from_now, checkout_time: 2.day.from_now) }
    it 'returns available rooms' do
      expect(service.execute(Time.current, 3.day.from_now)).to eq([room_2])
    end
  end

  context 'a room booked' do
    let!(:booking) { create(:booking, room: room_1, checkin_time: 1.day.ago, checkout_time: 1.day.from_now) }
    it 'returns available rooms' do
      expect(service.execute(Time.current, 2.day.from_now)).to eq([room_2])
    end
  end

  context 'a room booked' do
    let!(:booking) { create(:booking, room: room_1, checkin_time: 1.day.from_now, checkout_time: 4.day.from_now) }
    it 'returns available rooms' do
      expect(service.execute(Time.current, 3.day.from_now)).to eq([room_2])
    end
  end
end
