class GameboardsController < ApplicationController
  # GET /gameboards
  # GET /gameboards.json
  def index
    @gameboards = Gameboard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gameboards }
    end
  end

  # GET /gameboards/1
  # GET /gameboards/1.json
  def show
    @gameboard = Gameboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gameboard }
    end
  end

  # GET /gameboards/new
  # GET /gameboards/new.json
  def new
    @gameboard = Gameboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gameboard }
    end
  end

  # GET /gameboards/1/edit
  def edit
    @gameboard = Gameboard.find(params[:id])
  end

  # POST /gameboards
  # POST /gameboards.json
  def create
    @gameboard = Gameboard.new(params[:gameboard])

    respond_to do |format|
      if @gameboard.save
        format.html { redirect_to @gameboard, notice: 'Gameboard was successfully created.' }
        format.json { render json: @gameboard, status: :created, location: @gameboard }
      else
        format.html { render action: "new" }
        format.json { render json: @gameboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gameboards/1
  # PUT /gameboards/1.json
  def update
    @gameboard = Gameboard.find(params[:id])

    respond_to do |format|
      if @gameboard.update_attributes(params[:gameboard])
        format.html { redirect_to @gameboard, notice: 'Gameboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gameboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameboards/1
  # DELETE /gameboards/1.json
  def destroy
    @gameboard = Gameboard.find(params[:id])
    @gameboard.destroy

    respond_to do |format|
      format.html { redirect_to gameboards_url }
      format.json { head :no_content }
    end
  end
end
