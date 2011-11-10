module ReusableContainers
  class Engine < Rails::Engine
    isolate_namespace ReusableContainers
  end
end
