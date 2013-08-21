class CellcolorsController < ApplicationController
  # GET /cellcolors
  # GET /cellcolors.json
  def index
    @cellcolors = Cellcolor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cellcolors }
    end
  end

  # GET /cellcolors/1
  # GET /cellcolors/1.json
  def show
    @cellcolor = Cellcolor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cellcolor }
    end
  end

  # GET /cellcolors/new
  # GET /cellcolors/new.json
  def new
    @cellcolor = Cellcolor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cellcolor }
    end
  end

  # GET /cellcolors/1/edit
  def edit
    @cellcolor = Cellcolor.find(params[:id])
  end

  # POST /cellcolors
  # POST /cellcolors.json
  def create
    @cellcolor = Cellcolor.new(params[:cellcolor])

    respond_to do |format|
      if @cellcolor.save
        format.html { redirect_to @cellcolor, notice: 'Cellcolor was successfully created.' }
        format.json { render json: @cellcolor, status: :created, location: @cellcolor }
      else
        format.html { render action: "new" }
        format.json { render json: @cellcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cellcolors/1
  # PUT /cellcolors/1.json
  def update
    @cellcolor = Cellcolor.find(params[:id])

    respond_to do |format|
      if @cellcolor.update_attributes(params[:cellcolor])
        format.html { redirect_to @cellcolor, notice: 'Cellcolor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cellcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cellcolors/1
  # DELETE /cellcolors/1.json
  def destroy
    @cellcolor = Cellcolor.find(params[:id])
    @cellcolor.destroy

    respond_to do |format|
      format.html { redirect_to cellcolors_url }
      format.json { head :no_content }
    end
  end
end
