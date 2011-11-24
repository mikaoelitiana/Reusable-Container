module ReusableContainers
  module EntriesHelper
    def public_path_to_entry(entry)
      public_entry_url(:ancestry_slug => entry.ancestry_slug, :slug => entry.slug)
    end

    def public_link_to_entry(entry)
    Rails.logger.debug "ici => "
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
