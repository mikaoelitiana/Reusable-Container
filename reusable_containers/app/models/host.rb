class Host < ActiveRecord::Base
  validates_presence_of :name, :short_description

  has_many :events

  include Content
  entry_attributes :name => :name, :title => :name, :text => :name, :description => :short_description, :parent => Entry.home, :container => Container.default
end
