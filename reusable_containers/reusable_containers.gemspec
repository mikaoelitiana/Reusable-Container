$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reusable_containers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reusable_containers"
  s.version     = ReusableContainers::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ReusableContainers."
  s.description = "TODO: Description of ReusableContainers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
