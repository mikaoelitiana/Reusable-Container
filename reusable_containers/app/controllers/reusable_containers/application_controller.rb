module ReusableContainers
  class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :dark_side?, :meta, :current_entry, :current_container, :current_event

    layout Proc.new { |ctrl| dark_side? ? "application" : "containers/layouts/#{current_container.layout}" }

    def dark_side?
      logger.debug request.fullpath
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

    def current_event
      @current_event ||= Event.order{scheduled_at.desc}.first
    end

    def current_container
      @current_container ||= current_entry.container
    end
  end
end
