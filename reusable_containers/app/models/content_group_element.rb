class ContentGroupElement < ActiveRecord::Base
  belongs_to :content_group
  belongs_to :element, :polymorphic => true
end
