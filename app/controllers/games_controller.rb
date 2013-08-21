class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
	
	#@player = Player.find(session[:player_id])
	#if @player.admin_status
		@games = Game.all
	#else
		#@games = Game.where("player1_id = ? or player2_id =?", session[:player_id], session[:player_id])
	#end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
  
  def generate_game_rounds
	@game = Game.find(params[:id])
	
	if @game.round_generate_status != true
		
		for round in 1..@game.number_of_rounds
			@game_round = GameRound.new
			@game_round.game_id =@game.id
			@game_round.game_round_status = 0
			@game_round.player1_status = 0
			@game_round.player2_status = 0
			@game_round.save
			
			@gameboard = Gameboard.new
			@gameboard.game_round_id = @game_round.id
			
			#gameboard grid-size
			@gameboard.gridsize = 4
					
			@gameboard.player1_start_position = 1 + Random.rand(2)
			@gameboard.player2_start_position = 3 + Random.rand(2)
			#while(@player_position[0] == @player_position[1])
			#	@player_position[1] = 1 + Random.rand(3)
			#end

			#Goal position
			@gameboard.goal = 14 + Random.rand(2)
			@gameboard.save
			
			#Cell colors
			
			@cell_color = Array.new
			unwanted_colors = Array.new
			
			@color_pallet = ColorPallet.all
			@color_pallet_count = Hash.new
		
			#initialize color_pallet_count
		
		
			@color_pallet.each do|color|
				@color_pallet_count[color.id] = 0
			end

			for row in 1..@gameboard.gridsize
				for col in 1..@gameboard.gridsize
					cellnum = ((row-1)*@gameboard.gridsize) + (col-1)
					puts "Cellnum #{cellnum}"
					
					color = ([*1..5]  - unwanted_colors).sample
					
					if @color_pallet_count[color] == 3 
						unwanted_colors.push(color)
					end

					@cell_color[cellnum] = color
					@color_pallet_count[color] += 1

					puts "Cell_color: #{@color_pallet[@cell_color[cellnum]]}"
				end
			end
			
			@cell_color.each_with_index do|color, index|
				cellcolor = Cellcolor.new
				cellcolor.gameboard_id = @gameboard.id
				cellcolor.cellnumber = index
				cellcolor.color_pallet_id = color
				cellcolor.save
			end		
			
		end
		@game.round_generate_status = 1
		@game.save
	
	end
	
	respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
		
  end
  
end
