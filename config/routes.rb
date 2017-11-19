Rails.application.routes.draw do
  root to: 'quizzes#new'
  resources :quizzes, only: [:create] do
    resources :answers, only: [:new, :create]
  end
end
