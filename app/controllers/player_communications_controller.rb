class PlayerCommunicationsController < ApplicationController
  # GET /player_communications
  # GET /player_communications.json
  def index
    @player_communications = PlayerCommunication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_communications }
    end
  end

  # GET /player_communications/1
  # GET /player_communications/1.json
  def show
    @player_communication = PlayerCommunication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_communication }
    end
  end

  # GET /player_communications/new
  # GET /player_communications/new.json
  def new
    @player_communication = PlayerCommunication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_communication }
    end
  end

  # GET /player_communications/1/edit
  def edit
    @player_communication = PlayerCommunication.find(params[:id])
  end

  # POST /player_communications
  # POST /player_communications.json
  def create
    @player_communication = PlayerCommunication.new(params[:player_communication])

    respond_to do |format|
      if @player_communication.save
        format.html { redirect_to @player_communication, notice: 'Player communication was successfully created.' }
        format.json { render json: @player_communication, status: :created, location: @player_communication }
      else
        format.html { render action: "new" }
        format.json { render json: @player_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_communications/1
  # PUT /player_communications/1.json
  def update
    @player_communication = PlayerCommunication.find(params[:id])

    respond_to do |format|
      if @player_communication.update_attributes(params[:player_communication])
        format.html { redirect_to @player_communication, notice: 'Player communication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_communications/1
  # DELETE /player_communications/1.json
  def destroy
    @player_communication = PlayerCommunication.find(params[:id])
    @player_communication.destroy

    respond_to do |format|
      format.html { redirect_to player_communications_url }
      format.json { head :no_content }
    end
  end
end
