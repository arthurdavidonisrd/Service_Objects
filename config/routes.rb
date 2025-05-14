Rails.application.routes.draw do
  resources :grade_point_averages
  root "grade_point_averages#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
