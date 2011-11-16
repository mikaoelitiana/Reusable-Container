module ReusableContainers
  class EntriesController < ApplicationController
    # GET /entries
    # GET /entries.json
    def index
      @entries = Entry.page(params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @entries }
      end
    end

    # GET /entries/1
    # GET /entries/1.json
    def show
      if params[:id]
        @entry = Entry.find(params[:id], :include => [:container, :destination_object])
        respond_to do |format|
          format.html
          format.json { render :json => @entry }
        end
      elsif params[:slug]
        my_ancestry_slug = params[:ancestry_slug]
        my_slug = params[:slug]
        if my_slug =~ /\d+/
          @entry = Entry.find(my_slug)
        else
          @entry = Entry.where{ ancestry_slug == my_ancestry_slug }.where{ slug == my_slug }.first
        end
        raise ActiveRecord::RecordNotFound unless @entry
        if @entry.destination_params
          # on affiche le contenu du sous-action quand on n'est pas dans le côté obscur :)
          @my_env = env.dup
          my_request_params = params
          my_request_params = ActiveSupport::HashWithIndifferentAccess.new(@entry.destination_params)
          my_request_params[:current_entry_id] = @entry.id
          @my_env["action_dispatch.request.parameters"] = my_request_params
          my_status, my_header, my_response = @entry.destination_params[:controller_constant].send(:action, @entry.destination_params[:action]).call(@my_env)
          @action_body = my_response.body
        end
        respond_to do |format|
          format.html { render :layout => "public/application" } #{@entry.container.layout}" }
        end
      end
    end

    # GET /entries/new
    # GET /entries/new.json
    def new
      @entry = Entry.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @entry }
      end
    end

    # GET /entries/1/edit
    def edit
      @entry = Entry.find(params[:id])
    end

    # POST /entries
    # POST /entries.json
    def create
      @entry = Entry.new(params[:entry])

      respond_to do |format|
        if @entry.save
          format.html { redirect_to @entry, :notice => 'Entry was successfully created.' }
          format.json { render :json => @entry, :status => :created, :location => @entry }
        else
          format.html { render :action => "new" }
          format.json { render :json => @entry.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /entries/1
    # PUT /entries/1.json
    def update
      @entry = Entry.find(params[:id])

      respond_to do |format|
        if @entry.update_attributes(params[:entry])
          format.html { redirect_to @entry, :notice => 'Entry was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @entry.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /entries/1
    # DELETE /entries/1.json
    def destroy
      @entry = Entry.find(params[:id])
      @entry.destroy

      respond_to do |format|
        format.html { redirect_to entries_url }
        format.json { head :ok }
      end
    end
  end
end
