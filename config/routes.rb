Rails.application.routes.draw do
  # registrationsコントローラ使用時はauthディレクトリ内のregistrationsコントローラを指定
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  resources :messages, only: [:index]
end