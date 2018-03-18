Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'connections/add_connection'
  post 'connections/get_friends_list'
  post 'connections/get_common_friends_list'
  post 'connections/add_subscription'
  post 'connections/block_user'
  post 'connections/get_recipients'
end
