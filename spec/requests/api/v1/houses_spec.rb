require 'swagger_helper'

RSpec.describe 'houses API' do
  path '/api/v1/houses' do
    post 'Creates a house' do
      tags 'houses'
      consumes 'application/json', 'application/xml'
      parameter name: :house, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          location: { type: :string },
          price: { type: :integer },
          photo: { type: :string }
        },
        required: %w[name location price photo]
      }

      response '201', 'house created' do
        let(:house) { { name: 'foo', location: 'bar', photo: 'photo', price: '100' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:house) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/houses/{id}' do
    get 'Retrieves a house' do
      tags 'Houses', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'house found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 location: { type: :string },
                 price: { type: :integer },
                 photo: { type: :string }

               },
               required: %w[id name lacation price photo]

        let(:id) { House.create(name: 'foo', location: 'bar', photo: 'photo', price: '100').id }
        run_test!
      end

      response '404', 'house not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end
