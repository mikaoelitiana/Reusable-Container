module ReusableContainers
  class ContentGroup < ActiveRecord::Base
    validates_presence_of :name, :title
    validates_uniqueness_of :name
    has_many :content_group_elements

    include ReusableContainers::Content
    entry_attributes :name => :name, :title => :title, :text => :title, :parent => ReusableContainers::Entry.home, :container => ReusableContainers::Container.default
  end
end
