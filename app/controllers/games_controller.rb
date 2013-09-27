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

			extra1_player1 = Random.rand(4) + 1

			extra2_player1 = Random.rand(4) + 1
			while(extra1_player1 != extra2_player1)
				extra2_player1 = Random.rand(4) + 1
			end

			extra1_player2 = Random.rand(4) + 1
			extra2_player2 = Random.rand(4) + 1
			while(extra1_player2 != extra2_player2)
				extra2_player2 = Random.rand(4) + 1
			end

			@color_pallet.each do|color|

				player_color_bucket = PlayerColorBucket.new
				player_color_bucket.color_pallet_id = color.id
				player_color_bucket.player_id = @game.player1_id
				player_color_bucket.game_round_id = @game_round.id
				
				if(extra1_player1 == color.id or extra2_player1 == color.id)
					player_color_bucket.original_quantity = 2
					player_color_bucket.available_quantity = 2
				else
					player_color_bucket.original_quantity = 1
					player_color_bucket.available_quantity = 1
				end
				
				player_color_bucket.save

				player_color_bucket = PlayerColorBucket.new
				player_color_bucket.color_pallet_id = color.id
				player_color_bucket.player_id = @game.player2_id
				player_color_bucket.game_round_id = @game_round.id

				if(extra1_player2 == color.id or extra2_player2 == color.id)
					player_color_bucket.original_quantity = 2
					player_color_bucket.available_quantity = 2
				else
					player_color_bucket.original_quantity = 1
					player_color_bucket.available_quantity = 1
				end

				player_color_bucket.save

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

  def game_copy
  		game1 = Game.find(13)
  		game2 = Game.find(15)

  		#game1_rounds = GameRound.find_all_by_game_id(game1.id)
  		game1_rounds = GameRound.where(game_id: game1.id)
  		#game2_rounds = GameRound.find_all_by_game_id(game2.id)
  		game1_rounds.each do|game1_round|

  			p "Game1 Round #{game1_round.id}"

  			game2_round = GameRound.new
  			game2_round.game_id = game2.id
  			game2_round.save

  			p "Game2 Round #{game2_round.id}"

  			game1board = Gameboard.find_by_game_round_id(game1_round.id)

  			p "Game1 Board #{game1board.id}"

  			game2board = Gameboard.new
  			game2board.game_round_id = game2_round.id
  			game2board.gridsize = game1board.gridsize
  			game2board.player1_start_position = game1board.player1_start_position
  			game2board.player2_start_position = game1board.player2_start_position
  			game2board.player1_current_position = game1board.player1_current_position
  			game2board.player2_current_position = game1board.player2_current_position
  			game2board.goal = game1board.goal
  			game2board.player1_move_count = 0
  			game2board.player2_move_count = 0
  			game2board.save

  			p game1board.goal
  			p game2board.goal

  			p "Game2 Board #{game2board.id}"

  			#cellcolors1 = Cellcolor.find_all_by_gameboard_id(game1board.id)
  			cellcolors1 = Cellcolor.where(gameboard_id: game1board.id)

  			cellcolors1.each do|cellcolor1|
  				cellcolor2 = Cellcolor.new
  				cellcolor2.gameboard_id = game2board.id
  				cellcolor2.cellnumber = cellcolor1.cellnumber
  				cellcolor2.color_pallet_id = cellcolor1.color_pallet_id
  				cellcolor2.save
  			end

  			#player_color_buckets1 = PlayerColorBucket.find_all_by_gameboard_id(gameboard1.id)
  			player_color_buckets1 = PlayerColorBucket.where(game_round_id: game1_round.id)

  			player_color_buckets1.each do|player_color_bucket1|
  				player_color_bucket2 = PlayerColorBucket.new
  				player_color_bucket2.game_round_id = game2_round.id
  				if player_color_bucket1.player_id == game1.player1_id
  					player_color_bucket2.player_id = game2.player1_id
  				else
  					player_color_bucket2.player_id = game2.player2_id
  				end
  				player_color_bucket2.color_pallet_id = player_color_bucket1.color_pallet_id
  				player_color_bucket2.available_quantity = player_color_bucket1.available_quantity
  				player_color_bucket2.original_quantity = player_color_bucket1.original_quantity

  				player_color_bucket2.save
  			end

  		end
  		game2.number_of_rounds = game1.number_of_rounds
  		game2.round_generate_status = true
  		game2.save

  	respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end


  end
  
end
