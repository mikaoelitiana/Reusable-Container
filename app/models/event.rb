class Event < ActiveRecord::Base
  belongs_to :host

  include Content
  entry_attributes :name => :name, :title => :baseline, :text => :long_name, :parent => Entry.home, :container => Container.default

  def long_name
    "#{name} #{scheduled_at.year}"
  end
end
