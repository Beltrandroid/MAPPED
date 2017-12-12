Rails.application.routes.draw do
  get 'campaign/:campaign_id/access_requests', to: 'access_requests#index', as: 'campaign_access_requests'

  get 'campaign/:campaign_id/access_request/new', to: 'access_requests#new', as: 'campaign_access_request_new'

  get 'access_requests/new'

  get 'access_requests/create'

  get 'campaigns', to: 'campaigns#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  get 'workflow/diagram/:id', to: 'workflow#diagram'

  get 'user/profile/edit', to: 'users#edit'
  get 'user/profile/campaign/:campaign_id', to: 'users#edit', as: 'user_profile_for_campaign'
  match 'users/profile', to: 'users#update', via: [:patch, :put]
  get 'users/tfa'
  post 'users/enable_otp'
  post 'users/disable_otp'

  root 'home#index'
  get 'home', to: 'home#index'

  resources :attachments
  get 'attachments/:id/content', to: 'attachments#get_content', as: 'get_content'
  post 'attachments/:id/content', to: 'attachments#post_content', as: 'post_content'
  post 'attachments/content', to: 'attachments#new_content', as: 'new_content'

  get 'attachments/:id/thumbnail', to: 'attachments#thumbnail', as: 'thumbnail'
end
