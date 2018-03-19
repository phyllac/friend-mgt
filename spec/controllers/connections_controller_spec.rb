require 'rails_helper'

RSpec.describe Api::V1::ConnectionsController, type: :controller do

    describe 'POST /connections/add_connection' do
        before { post 'add_connection' }

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST /connections/get_friends_list' do
        before { post 'get_friends_list' }
    
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST /connections/get_common_friends_list' do
        before { post 'get_common_friends_list' }
    
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST /connections/add_subscription' do
        before { post 'add_subscription' }
    
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST /connections/block_user' do
        before { post 'block_user' }
    
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST /connections/get_recipients' do
        before { post 'get_recipients' }
    
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

end
