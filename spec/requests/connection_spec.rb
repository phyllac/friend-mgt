require 'rails_helper'

RSpec.describe 'Connections API', type: :request do

    # 1. As a user, I need an API to create a friend connection between two email addresses.
    describe 'POST /api/v1/connections' do

        let(:valid_attributes) { 
            {
                friends: 
                [
                    'andy@example.com',
                    'john@example.com'
                ]
            }
         }

        let(:invalid_attributes) { 
            {
                friends: 
                [
                    'john@example.com',
                    'john@example.com'
                ]
            }
         }

        let(:valid_json_result) {
            {
                "success": true
            }
        }

        context 'when JSON input parameter is empty' do
            before { post '/api/v1/connections', {} }

            it 'returns a JSON input parameter is empty error message' do
                expect(response.body).to match(/JSON input parameter is empty/)
            end

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

        context 'when connection added successfully' do
            before { post '/api/v1/connections', params: valid_attributes }
            
            it 'returns a success JSON output ' do
                expect(response.body).to eq(valid_json_result.to_json)
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

        end

        context 'when adding connection failed' do
            before { post '/api/v1/connections', params: invalid_attributes }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

    end

    # 2. As a user, I need an API to retrieve the friends list for an email address.
    describe 'POST /api/v1/friends' do

        let(:valid_attributes) {
            {
                email: 'andy@example.com'
            }
        }

        let(:invalid_attributes) { 
            {
                foo: 'andy@example.com'
            }
         }

        context 'when JSON input parameter is empty or invalid' do
            before { post '/api/v1/friends', {} }

            it 'returns a JSON input parameter is empty or invalid error message' do
                expect(response.body).to match(/JSON input parameter is empty or invalid/)
            end

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

        context 'when friends get list is successful' do
            before { post '/api/v1/friends', params: valid_attributes }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

        end

    end

    # 3. As a user, I need an API to retrieve the common friends list between two email addresses.
    describe 'POST /api/v1/common_friends' do

        let(:valid_attributes) {
            {
                friends:
                [
                    'andy@example.com',
                    'john@example.com'
                ]
            }
        }

        let(:invalid_attributes) { 
            {
                foo:
                [
                    'andy@example.com',
                    'john@example.com'
                ]
            }
        }

        context 'when JSON input parameter is empty or invalid' do
            before { post '/api/v1/common_friends', params: invalid_attributes }

            it 'returns a JSON input parameter is empty or invalid error message' do
                expect(response.body).to match(/JSON input parameter is empty or invalid/)
            end

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

        context 'when common friends get list is successful' do
            before { post '/api/v1/common_friends', params: valid_attributes }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

        end

    end

    # 4. As a user, I need an API to subscribe to updates from an email address.
    describe 'POST /api/v1/subscriptions' do

        let(:valid_attributes) {
            {
                "requestor": "lisa@example.com",
                "target": "john@example.com"
            }
        }

        let(:invalid_attributes) { 
            {
                "foo": "lisa@example.com",
                "target": "@example.com"
            }
        }

        let(:valid_json_result) {
            {
                "success": true
            }
        }

        context 'when JSON input parameter is empty or invalid' do
            before { post '/api/v1/subscriptions', params: invalid_attributes }

            it 'returns a JSON input parameter is empty or invalid error message' do
                expect(response.body).to match(/JSON input parameter is empty or invalid/)
            end

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

        context 'when subscription was successful' do
            before { post '/api/v1/subscriptions', params: valid_attributes }
            
            it 'returns a success JSON output ' do
                expect(response.body).to eq(valid_json_result.to_json)
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

        end

        context 'when subscription failed' do
            before { post '/api/v1/subscriptions', params: invalid_attributes }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end        

    end

    # 5. As a user, I need an API to block updates from an email address.
    describe 'POST /api/v1/blocks' do

        let(:valid_attributes) {
            {
                "requestor": "lisa@example.com",
                "target": "john@example.com"
            }
        }

        let(:invalid_attributes) { 
            {
                "foo": "lisa@example.com",
                "target": "@example.com"
            }
        }

        let(:valid_json_result) {
            {
                "success": true
            }
        }

        context 'when JSON input parameter is empty or invalid' do
            before { post '/api/v1/blocks', params: invalid_attributes }

            it 'returns a JSON input parameter is empty or invalid error message' do
                expect(response.body).to match(/JSON input parameter is empty or invalid/)
            end

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

        context 'when blocking was successful' do
            before { post '/api/v1/blocks', params: valid_attributes }
            
            it 'returns a success JSON output ' do
                expect(response.body).to eq(valid_json_result.to_json)
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

        end

        context 'when blocking failed' do
            before { post '/api/v1/blocks', params: invalid_attributes }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

    end

    # 6. As a user, I need an API to retrieve all email addresses that can receive updates from an email address.
    describe 'POST /api/v1/recipients' do

        let(:valid_attributes) {
            {
                "sender":  "john@example.com",
                "text": "Hello World! kate@example.com"
            }
        }

        let(:invalid_attributes) { 
            {
                "foo": "lisa@example.com",
                "target": "@example.com"
            }
        }

        context 'when JSON input parameter is empty or invalid' do
            before { post '/api/v1/recipients', params: invalid_attributes }

            it 'returns a JSON input parameter is empty or invalid error message' do
                expect(response.body).to match(/JSON input parameter is empty or invalid/)
            end

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end

        context 'when recipients get list is successful' do
            before { post '/api/v1/recipients', params: valid_attributes }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

        end

    end

end