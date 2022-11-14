require 'rails_helper'

RSpec.describe House, type: :model do
  subject(:house) do
    House.create(name:'hill top',photo: 'https://a0.muscache.com/im/pictures/5449c37e-5399-4200-944a-561962b8b3fc.jpg?im_w=1200', price:50, location:'Kenya')
  end


  it 'is valid with valid attributes' do
    expect(house).to be_valid
  end

   it 'is not valid without a name' do
    house.name = nil
    expect(house).to_not be_valid
  end

    it 'is not valid without a house location' do
    house.location = nil
    expect(house).to_not be_valid
  end

  it 'is not valid without a price per night' do
    house.price = nil
    expect(house).to_not be_valid
  end

end