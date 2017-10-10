Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
match '/sums', :to => 'application#sbor', :via => [:post]
match '/filters', :to => 'application#filters', :via => [:post]
match '/intervals', :to => 'application#naigolqma', :via => [:post]
match '/lin_regressions', :to => 'application#regresiq', :via => [:post]
end
