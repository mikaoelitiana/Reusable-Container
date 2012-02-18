class Container < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :entries

  def self.default
    Container.find(1)
  end
end
