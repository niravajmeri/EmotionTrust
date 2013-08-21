class TrustsController < ApplicationController
  # GET /trusts
  # GET /trusts.json
  def index
    @trusts = Trust.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trusts }
    end
  end

  # GET /trusts/1
  # GET /trusts/1.json
  def show
    @trust = Trust.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trust }
    end
  end

  # GET /trusts/new
  # GET /trusts/new.json
  def new
    @trust = Trust.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trust }
    end
  end

  # GET /trusts/1/edit
  def edit
    @trust = Trust.find(params[:id])
  end

  # POST /trusts
  # POST /trusts.json
  def create
    @trust = Trust.new(params[:trust])

    respond_to do |format|
      if @trust.save
        format.html { redirect_to @trust, notice: 'Trust was successfully created.' }
        format.json { render json: @trust, status: :created, location: @trust }
      else
        format.html { render action: "new" }
        format.json { render json: @trust.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trusts/1
  # PUT /trusts/1.json
  def update
    @trust = Trust.find(params[:id])

    respond_to do |format|
      if @trust.update_attributes(params[:trust])
        format.html { redirect_to @trust, notice: 'Trust was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trust.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trusts/1
  # DELETE /trusts/1.json
  def destroy
    @trust = Trust.find(params[:id])
    @trust.destroy

    respond_to do |format|
      format.html { redirect_to trusts_url }
      format.json { head :no_content }
    end
  end
end
