require 'rails_helper'

describe 'Authentication', type: :request do
    describe 'POST /authenticate' do
        it 'authenticates the client' do
            post '/api/v1/authenticate', params: { email: 'akosipc@gmail.com', password: "password"}

            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body)).to eq({
                "token" => '123'
            })
        end

        it 'returns error when email is missing' do
            post '/api/v1/authenticate', params: { email: '', password: "password"}
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to eq({
                'error' => 'param is missing or the value is empty: username'
            })
        end

        it 'returns error when password is missing' do
            post '/api/v1/authenticate', params: { email: 'akosipc@gmail.com', password: ""}
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to eq({
                'error' => 'param is missing or the value is empty: password'
            })
        end
    end
end