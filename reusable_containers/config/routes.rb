ReusableContainers::Engine.routes.draw do
  scope "admin" do
    resources :content_groups
    resources :free_contents
    resources :events
    resources :hosts
    resources :containers
    resources :entries
    resources :subscriptions
    resources :pages
    scope ":element_type_controller/:element_id" do
      resources :content_group_elements
    end
    root :to => "administration#index"
  end
  
	match '(*ancestry_slug)/:slug' => "entries#show", :as => :public_entry
	root :to => 'entries#show', :slug => "1", :as => :public_root
end
