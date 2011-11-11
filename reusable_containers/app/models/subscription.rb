class Subscription < ActiveRecord::Base
  SubscribeAs = [
    "Attendee",
    "Blogger",
    "Presenter",
    "Volunteer",
    "Sponsor",
    "Partner",
    "Other"
  ].freeze
  Titles = [
    "Mr",
    "Mrs"
  ]
  validates_presence_of :lastname, :email, :as
  def fullname
    [ title, firstname, lastname ].select{ |n| !n.blank? }.join(" ")
  end
end
