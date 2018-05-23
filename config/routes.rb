Rails.application.routes.draw do
	resources :places

	get '/seed', to: 'places#seed_lists'
	get '/addnid', to: 'places#add_neighborhood_id'
end
