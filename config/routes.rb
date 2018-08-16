Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resource :authors do
        collection do
            get :index
        end
    end
    
    resource :users do

    end
end
