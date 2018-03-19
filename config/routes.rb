Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do 
      post 'connections' => 'connections#add_friend'
      post 'friends' => 'connections#get_friends'
      post 'common_friends' => 'connections#get_common_friends'
      post 'subscriptions' => 'connections#add_subscription'
      post 'blocks' => 'connections#block_user'
      post 'recipients' => 'connections#get_recipients'
    end
  end
end
