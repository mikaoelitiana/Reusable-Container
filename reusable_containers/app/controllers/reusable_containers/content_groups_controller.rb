module ReusableContainers
  class ContentGroupsController < ApplicationController
    # GET /content_groups
    # GET /content_groups.json
    def index
      @content_groups = ContentGroup.page(params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @content_groups }
      end
    end

    # GET /content_groups/1
    # GET /content_groups/1.json
    def show
      @content_group = ContentGroup.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @content_group }
      end
    end

    # GET /content_groups/new
    # GET /content_groups/new.json
    def new
      @content_group = ContentGroup.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @content_group }
      end
    end

    # GET /content_groups/1/edit
    def edit
      @content_group = ContentGroup.find(params[:id])
    end

    # POST /content_groups
    # POST /content_groups.json
    def create
      @content_group = ContentGroup.new(params[:content_group])

      respond_to do |format|
        if @content_group.save
          format.html { redirect_to @content_group, :notice => 'Content group was successfully created.' }
          format.json { render :json => @content_group, :status => :created, :location => @content_group }
        else
          format.html { render :action => "new" }
          format.json { render :json => @content_group.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /content_groups/1
    # PUT /content_groups/1.json
    def update
      @content_group = ContentGroup.find(params[:id])

      respond_to do |format|
        if @content_group.update_attributes(params[:content_group])
          format.html { redirect_to @content_group, :notice => 'Content group was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @content_group.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /content_groups/1
    # DELETE /content_groups/1.json
    def destroy
      @content_group = ContentGroup.find(params[:id])
      @content_group.destroy

      respond_to do |format|
        format.html { redirect_to content_groups_url }
        format.json { head :ok }
      end
    end
  end
end
