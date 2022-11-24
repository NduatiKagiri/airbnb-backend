require 'swagger_helper'

RSpec.describe 'api/vi/reservations', type: :request do
  after(:all) do
    Reservation.destroy_all
    User.destroy_all
  end
  let(:user) { create(:user) }
  let(:Authorization) { generate_jwt_token_for(user) }
 path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      produces 'application/json'
      security [bearerAuth: []]

      response(200, 'successful') do
        before { create_list(:house, 1) }
        example 'application/json', :successful, {
          code: 200,
          data: [
            {
              id: '1',
              type: 'reservation',
              attributes: {
                id: 1,
                user_id: 1,
                house_id: 1,
                date_in: '2022-10-28',
                date_out: '2022-11-21'
              }
            }
          ]
        }
        run_test!
      end
    end
     post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date_in: { type: :string, format: :date },
          date_out: { type: :string, format: :date },
          house: { type: :string }
        },
        required: %w[date_in date_out house]
      }
      security [bearerAuth: []]

      response(201, 'successful') do
        let!(:house) { create(:house) }
        let(:reservation) { { reservation: attributes_for(:reservation) } }
        example 'application/json', :successful, {
          code: 201,
          data: {
            id: 6,
            date_in: '2022-10-28',
            date_out: '2022-11-21',
            house: 'house 1'
          }
        }
        run_test!
      end
    end
  end
end
