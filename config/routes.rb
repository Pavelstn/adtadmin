Adtadmin::Engine.routes.draw do
  resources :types


match 'agentprofiles/findbypost/:post_id' => 'agentprofiles#findbypost', :post_id => :post_id

  resources :partners


  mount Ckeditor::Engine => '/ckeditor'

  resources :reviews


  resources :regions


  resources :news_lists


  resources :images
  match 'images/findbypost/:post_id' => 'images#findbypost', :post_id => :post_id


  resources :categories

  
  resources :agentprofiles
  


  resources :accountabilityagents

  post "posts/index"
  resources :posts


end
