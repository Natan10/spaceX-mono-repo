Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api ,defaults: {format: :json} do
    get 'health_check', to: 'check#health_check'
    get 'all', to: 'launch#all_launches'
    get 'upcoming', to: 'launch#upcoming_launches'
    get 'past', to: 'launch#past_launches'
    get 'next', to: 'launch#next_launch'
    get 'latest', to: 'launch#latest_launch'
  end
end
