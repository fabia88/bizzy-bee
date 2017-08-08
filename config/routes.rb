Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jobs do
    resources :requests, only: [:new, :create]
  end
  resources :requests, only: [:index]
  patch "requests/:id/confirm", to: "requests#confirm"
  patch "requests/:id/deny", to: "requests#deny"
  patch "requests/:id/cancel", to: "requests#cancel"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# List of user stories vs rails routes:

# GET -> "/" -> pages#home
# root GET    /                                    pages#home

# GET -> jobs -> jobs#index
# jobs GET    /jobs(.:format)                      jobs#index

# GET-> jobs/:id -> jobs#show
# job GET    /jobs/:id(.:format)                  jobs#show

# GET -> jobs/new -> jobs#new
# new_job GET    /jobs/new(.:format)                  jobs#new

# POST -> jobs -> jobs#create
# POST   /jobs(.:format)                      jobs#create

# GET -> jobs/:id/edit -> jobs#edit
# edit_job GET    /jobs/:id/edit(.:format)             jobs#edit

# PATCH -> jobs/:id -> jobs#update
# PATCH  /jobs/:id(.:format)                  jobs#update
# PUT    /jobs/:id(.:format)                  jobs#update

# GET -> jobs/:job_id/requests/new -> requests#new
# new_job_request GET    /jobs/:job_id/requests/new(.:format) requests#new

# POST -> jobs/:job_id/requests -> requests#create
# job_requests POST   /jobs/:job_id/requests(.:format)     requests#create

# GET -> requests -> requests#index
# requests GET    /requests(.:format)                  requests#index

# DELETE -> jobs/:id -> jobs#destroy
# DELETE /jobs/:id(.:format)                  jobs#destroy

# PATCH -> requests/:id/confirm -> requests#confirm
# PATCH  /requests/:id/confirm(.:format)      requests#confirm

# PATCH -> requests/:id/deny -> requests#deny
# PATCH  /requests/:id/deny(.:format)         requests#deny

# PATCH -> requests/:id/cancel -> requests#cancel
# PATCH  /requests/:id/cancel(.:format)       requests#cancel
