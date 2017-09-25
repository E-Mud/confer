Rails.application.routes.draw do
  post 'apps', to: 'apps#create'
  get 'apps/:app_id', to: 'apps#get'
  get 'apps', to: 'apps#list'

  post 'auth/login'

  post 'signup', to: 'account#signup'
end
