class FreeContent < ActiveRecord::Base
  ContentTypes = [
    :html,
    :textile,
    :markdown,
    :simple_text,
    :youtube_video_link
  ].freeze
  validates_presence_of :name, :title, :content_type
  validates_uniqueness_of :name
  include Element
end
