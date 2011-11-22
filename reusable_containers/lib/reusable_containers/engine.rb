module ReusableContainers
  class Engine < Rails::Engine
    isolate_namespace ReusableContainers
    config.to_prepare do
      ApplicationController.helper(ReusableContainers::ApplicationHelper)
    end
  end
end
