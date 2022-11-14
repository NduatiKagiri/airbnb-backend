require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject(:reservation) do
Reservation.create(date_in:'may 1', date_out: 'may 9')
  end

   it 'is not valid without a date_in' do
    reservation.date_in = nil
    expect(reservation).to_not be_valid
  end

   it 'is not valid without a date_out' do
    reservation.date_out = nil
    expect(reservation).to_not be_valid
  end
end