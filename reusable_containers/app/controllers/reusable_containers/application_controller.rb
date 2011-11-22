module ReusableContainers
  class ApplicationController < ActionController::Base
    protect_from_forgery
    #helper_method :dark_side?, :meta, :current_entry, :current_container, :public_root_path
    layout Proc.new { |ctrl| dark_side? ? "application" : "containers/layouts/#{current_container.layout}" }
  end
end
