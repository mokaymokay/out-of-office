Rails.application.routes.draw do
	resources :places

	get '/seed', to: 'places#seed'
end
