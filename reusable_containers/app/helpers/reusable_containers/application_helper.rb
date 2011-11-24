module ReusableContainers
  module ApplicationHelper
    def dark_side?
      Rails.logger.debug request.fullpath
      request.fullpath =~ /\/admin/
    end

    def meta
      @meta ||= Meta.instance
      unless @meta.title?
        @meta.title= "#{self.action_name} | #{self.controller_name}"
      end
      @meta
    end

    def current_entry
      @entry ||= Entry.find(params[:current_entry_id], :include => :container)
    end

    def current_container
      @current_container ||= current_entry.container
    end
    
    def public_path_to_entry(entry)
      public_entry_url(:ancestry_slug => entry.ancestry_slug, :slug => entry.slug)
    end

    def public_link_to_entry(entry)
      if entry != current_entry && entry.active?
        if entry.direct?
          link_to entry.text, entry.destination_string, :title => entry.title, :class => "entry_links"
        elsif entry.is_root?
          link_to entry.text, public_root_path, :title => entry.title, :class => "entry_links"
        else
          link_to entry.text, public_path_to_entry(entry), :title => entry.title, :class => "entry_links"
        end
      else
        content_tag :span, entry.text, :class => "entry_links", :title => entry.title
      end
    end
  end
  
end
