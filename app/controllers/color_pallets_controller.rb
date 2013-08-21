class ColorPalletsController < ApplicationController
  # GET /color_pallets
  # GET /color_pallets.json
  def index
    @color_pallets = ColorPallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @color_pallets }
    end
  end

  # GET /color_pallets/1
  # GET /color_pallets/1.json
  def show
    @color_pallet = ColorPallet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @color_pallet }
    end
  end

  # GET /color_pallets/new
  # GET /color_pallets/new.json
  def new
    @color_pallet = ColorPallet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @color_pallet }
    end
  end

  # GET /color_pallets/1/edit
  def edit
    @color_pallet = ColorPallet.find(params[:id])
  end

  # POST /color_pallets
  # POST /color_pallets.json
  def create
    @color_pallet = ColorPallet.new(params[:color_pallet])

    respond_to do |format|
      if @color_pallet.save
        format.html { redirect_to @color_pallet, notice: 'Color pallet was successfully created.' }
        format.json { render json: @color_pallet, status: :created, location: @color_pallet }
      else
        format.html { render action: "new" }
        format.json { render json: @color_pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /color_pallets/1
  # PUT /color_pallets/1.json
  def update
    @color_pallet = ColorPallet.find(params[:id])

    respond_to do |format|
      if @color_pallet.update_attributes(params[:color_pallet])
        format.html { redirect_to @color_pallet, notice: 'Color pallet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @color_pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_pallets/1
  # DELETE /color_pallets/1.json
  def destroy
    @color_pallet = ColorPallet.find(params[:id])
    @color_pallet.destroy

    respond_to do |format|
      format.html { redirect_to color_pallets_url }
      format.json { head :no_content }
    end
  end
end
