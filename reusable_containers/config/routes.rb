ReusableContainers::Engine.routes.draw do
	match '(*ancestry_slug)/:slug' => "entries#show", :as => :public_entry
	root :to => 'entries#show', :slug => "1", :as => :public_root
end
