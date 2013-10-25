class GameRoundsController < ApplicationController
  # GET /game_rounds
  # GET /game_rounds.json
  def index
    @game_rounds = GameRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_rounds }
    end
  end

  # GET /game_rounds/1
  # GET /game_rounds/1.json
  def show
    @game_round = GameRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_round }
    end
  end

  # GET /game_rounds/new
  # GET /game_rounds/new.json
  def new
    @game_round = GameRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game_round }
    end
  end

  # GET /game_rounds/1/edit
  def edit
    @game_round = GameRound.find(params[:id])
  end

  # POST /game_rounds
  # POST /game_rounds.json
  def create
    @game_round = GameRound.new(params[:game_round])

    respond_to do |format|
      if @game_round.save
        format.html { redirect_to @game_round, notice: 'Game round was successfully created.' }
        format.json { render json: @game_round, status: :created, location: @game_round }
      else
        format.html { render action: "new" }
        format.json { render json: @game_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /game_rounds/1
  # PUT /game_rounds/1.json
  def update
    @game_round = GameRound.find(params[:id])

    respond_to do |format|
      if @game_round.update_attributes(params[:game_round])
        format.html { redirect_to @game_round, notice: 'Game round was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_rounds/1
  # DELETE /game_rounds/1.json
  def destroy
    @game_round = GameRound.find(params[:id])
    @game_round.destroy

    respond_to do |format|
      format.html { redirect_to game_rounds_url }
      format.json { head :no_content }
    end
  end

  def affect_data_list
    @game_rounds = GameRound.where("game_id > ?", 6)
    @games = Game.where("id > ?", 6)

    trust_change = Array.new
    mood_change = Array.new

    start_trust = 0
    start_mood = 0 

    end_trust = 0
    end_mood = 0

    respond_to do|format|
      format.html {render action: "affect_data_list", :layout => false}
    end


  end

end
