module ReusableContainers
  class Entry < ActiveRecord::Base
    extend ActiveSupport::Memoizable
    extend FriendlyId
    friendly_id :title,
      :use => [
        :slugged,
        :scoped,
        :reserved
      ],
      :scope => :ancestry_slug,
      :reserved_words => [
        :admin
      ]

    belongs_to :container
    has_ancestry :cache_depth => true

    belongs_to :destination_object, :polymorphic => true

    validates_presence_of :name, :title, :text
    validates_uniqueness_of :title, :scope => :ancestry_slug

    before_validation :set_ancestry_slug
    after_save :update_descendants_slug

    scope :published, :conditions => { :published => true }

    def self.home
      Entry.find(1)
    end

    def to_param
      # parce qu'on n'utilise pas directement friendly_id
      id.to_s
    end

    def possible_alternative_parents
      return Entry.all if self.new_record?
      my_subtree_ids = self.subtree_ids
      Entry.where{ id << my_subtree_ids }
    end
    memoize :possible_alternative_parents

    def destination_params
      if self.destination_object_id?
        my_params = {}
        my_params[:controller] = self.destination_object.class.table_name
        my_params[:controller_constant] = "#{self.destination_object.class.table_name}_controller".camelcase.constantize
        my_params[:action] = 'show'
        my_params[:id] = self.destination_object.to_param
        return my_params
      elsif self.direct?
        return self.destination_string
      elsif self.destination_string =~ /#/
        my_params = {}
        my_params[:controller], my_action_with_params = self.destination_string.split("#")
        my_params[:controller_constant] = "#{my_params[:controller]}_controller".camelcase.constantize
        my_params[:action], my_params_string = my_action_with_params.split("?")
        my_params_string.try(:split, "&").try(:map){|e| e.try(:split, "=")}.try(:each){ |k,v| my_params[k.to_sym] = v }
        return my_params
      else
        return nil
      end
    end
    memoize :destination_params

    def direct?
      !!(self.destination_string =~ /^(http|ftp|mailto)/)
    end

    def active?
      !!self.destination_params
    end

    private
    def update_descendants_slug
      self.children.find_each do |c|
        c.ancestry_slug = [self.ancestry_slug, self.slug].compact.join("/")
        c.save if c.changed
      end
    end

    def set_ancestry_slug
      if self.ancestry_changed?
        if self.parent
          self.ancestry_slug = [self.parent.ancestry_slug, self.parent.slug].compact.join("/")
        else
          self.ancestry_slug = nil
        end
      end
    end
  end
end
