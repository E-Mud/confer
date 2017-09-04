Rails.application.routes.draw do
  post 'auth/login'

  post 'signup', to: 'account#signup'
end
