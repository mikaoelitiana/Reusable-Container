class ContentGroupElementsController < ApplicationController
  # GET /content_group_elements
  # GET /content_group_elements.json
  def index
    @content_group_elements = ContentGroupElement.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @content_group_elements }
    end
  end

  # GET /content_group_elements/1
  # GET /content_group_elements/1.json
  def show
    @content_group_element = ContentGroupElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @content_group_element }
    end
  end

  # GET /content_group_elements/new
  # GET /content_group_elements/new.json
  def new
    @content_group_element = ContentGroupElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @content_group_element }
    end
  end

  # GET /content_group_elements/1/edit
  def edit
    @content_group_element = ContentGroupElement.find(params[:id])
  end

  # POST /content_group_elements
  # POST /content_group_elements.json
  def create
    @content_group_element = ContentGroupElement.new(params[:content_group_element])

    respond_to do |format|
      if @content_group_element.save
        format.html { redirect_to @content_group_element, :notice => 'Content group element was successfully created.' }
        format.json { render :json => @content_group_element, :status => :created, :location => @content_group_element }
      else
        format.html { render :action => "new" }
        format.json { render :json => @content_group_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_group_elements/1
  # PUT /content_group_elements/1.json
  def update
    @content_group_element = ContentGroupElement.find(params[:id])

    respond_to do |format|
      if @content_group_element.update_attributes(params[:content_group_element])
        format.html { redirect_to @content_group_element, :notice => 'Content group element was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @content_group_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_group_elements/1
  # DELETE /content_group_elements/1.json
  def destroy
    @content_group_element = ContentGroupElement.find(params[:id])
    @content_group_element.destroy

    respond_to do |format|
      format.html { redirect_to content_group_elements_url }
      format.json { head :ok }
    end
  end
end
