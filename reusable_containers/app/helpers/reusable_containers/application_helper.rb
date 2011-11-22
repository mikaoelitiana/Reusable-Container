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
  end
  
end
