class TransferResourcesController < ApplicationController
  # GET /transfer_resources
  # GET /transfer_resources.json
  def index
    @transfer_resources = TransferResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transfer_resources }
    end
  end

  # GET /transfer_resources/1
  # GET /transfer_resources/1.json
  def show
    @transfer_resource = TransferResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transfer_resource }
    end
  end

  # GET /transfer_resources/new
  # GET /transfer_resources/new.json
  def new
    @transfer_resource = TransferResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transfer_resource }
    end
  end

  # GET /transfer_resources/1/edit
  def edit
    @transfer_resource = TransferResource.find(params[:id])
  end

  # POST /transfer_resources
  # POST /transfer_resources.json
  def create
    @transfer_resource = TransferResource.new(params[:transfer_resource])

    respond_to do |format|
      if @transfer_resource.save
        format.html { redirect_to @transfer_resource, notice: 'Transfer resource was successfully created.' }
        format.json { render json: @transfer_resource, status: :created, location: @transfer_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @transfer_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transfer_resources/1
  # PUT /transfer_resources/1.json
  def update
    @transfer_resource = TransferResource.find(params[:id])

    respond_to do |format|
      if @transfer_resource.update_attributes(params[:transfer_resource])
        format.html { redirect_to @transfer_resource, notice: 'Transfer resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transfer_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfer_resources/1
  # DELETE /transfer_resources/1.json
  def destroy
    @transfer_resource = TransferResource.find(params[:id])
    @transfer_resource.destroy

    respond_to do |format|
      format.html { redirect_to transfer_resources_url }
      format.json { head :no_content }
    end
  end
end
