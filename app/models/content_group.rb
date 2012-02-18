class ContentGroup < ActiveRecord::Base
  validates_presence_of :name, :title
  validates_uniqueness_of :name
  has_many :content_group_elements

  include Content
  entry_attributes :name => :name, :title => :title, :text => :title, :parent => Entry.home, :container => Container.default
end
