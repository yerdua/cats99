Cats99::Application.routes.draw do
  put 'cat_rental_requests/:id' => 'cat_rental_requests#approve',
      :as => 'approve_request'
  resources :cats do
    resources :cat_rental_requests
  end
end
