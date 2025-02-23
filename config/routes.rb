Rails.application.routes.draw do
  root "pages#home"
  get 'login', to: 'sessions#new' # Login page
  get 'contactt', to: 'contact#contactus' # Contact us page
  get 'aboutt', to: 'about#aboutus' # About us page
  get 'stafflogin', to: 'sessions#stafflogin' # About us page
  get 'partnerlogin', to: 'sessions#partnerlogin' # About us page
end
