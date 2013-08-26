class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  def index
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
  def login
  
	if(session[:player_id])
		player = Player.find(session[:player_id])
		player.login_status = false;
		player.save
		session[:player_id] = nil
	end

	@player = Player.new
	respond_to do |format|
      format.html # login.html.erb
	end
  end
  
  def login_check
	@player = Player.find_by_email(params[:email])
	
	respond_to do|format|
		if @player
			session[:player_id] = @player.id
			#if @player.admin_status
			#	format.html {redirect_to games_url}
			#else
			@player.login_status=true
			@player.save
				format.html {redirect_to :controller => :players, :action => :player_games}
			#end
		else
			format.html {render action: "login"}
		end
	end
  end
    
  def player_games
	@player = Player.find(session[:player_id])
	@games = Game.where("player1_id = ? or player2_id =?", @player.id, @player.id)
	
	respond_to do|format|
		format.html {render action: "player_games"}
	end
  end
  
  def mood_measure_form
	@game = Game.find(params[:id])
	@moods = Mood.all
	
	respond_to do|format|
		format.html {render action: "mood_measure_form"}
	end
	
  end
  
  def expectation_measure_form
	@game_round = GameRound.find(params[:id])
	@expectations = Expectation.all
	
	respond_to do|format|
		format.html {render action: "expectation_measure_form"}
	end
	
  end
  
  def emotion_measure_form
	@game_round = GameRound.find(params[:id])
	@emotions = Emotions.all
	
	@start_end_check = params[:start_end_check]
	
	respond_to do|format|
		format.html {render action: "emotion_measure_form"}
	end
	
  end
  
  def mood_measure
	@game = Game.find(params[:id])
	@player_id = session[:player_id]
	
	start_end_check = params[:start_end_check]
	
	if (start_end_check == "start")
		if @game.player1_id == @player_id
			@game.player1_start_mood = params[:mood]
		elsif @game.player2_id == @player_id
			@game.player2_start_mood = params[:mood]
		end
		
	elsif (start_end_check == "end")
	
		if @game.player1_id == @player_id
			@game.player1_end_mood = params[:mood]
		elsif @game.player2_id == @player_id
			@game.player2_end_mood = params[:mood]
		end

	end
	@game.save
		
	respond_to do|format|
		format.html {redirect_to :controller => :players, :action => :player_game_rounds, :id => @game.id}
	end
	
  end
  
  def player_game_rounds
	@player = Player.find(session[:player_id])
	@game = Game.find(params[:id])
	@game_rounds = GameRound.where("game_id = ?", @game.id)
	
	respond_to do|format|
		format.html {render action: "player_game_rounds"}
	end
  end
  
  def game_board
	#@game_round_id = params[:game_round_id]
	#@game_round = GameRound.find(@game_round_id)
	#@gameboard = Gameboard.where("game_round_id = ?", @game_round_id)
	#@gameboard = @game_round.gameboard
	
	
	@gameboard = Gameboard.find(params[:gameboard_id])
	@game_round_id = @gameboard.game_round_id
	@game_round = GameRound.find(@game_round_id)
	
	#if @gameboard.size > 0
	#	@gameboard = @gameboard[0]
	#end
	
	puts "IN PLAYER GAME BOARD"
	puts "Game Round Id: #{@game_round_id}"

	@color_pallets = ColorPallet.all

	@player_color_bucket = Hash.new
	@opponent_color_bucket = Hash.new
	
	@player = Player.find(session[:player_id])
	@game = Game.find(@game_round.game_id)
	
	if(@game.player1_id == @player.id)
		@player_start_position = @gameboard.player1_start_position
		@player_current_position = @gameboard.player1_current_position
		
		@opponent_start_position = @gameboard.player2_start_position
		@opponent_current_position = @gameboard.player2_current_position

		@color_pallets.each do|color_pallet|
			@player_color_bucket[color_pallet.id] = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player1_id, color_pallet.id).available_quantity
			@opponent_color_bucket[color_pallet.id] =  PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player2_id, color_pallet.id).available_quantity
		end


	else
		@player_start_position = @gameboard.player2_start_position
		@player_current_position = @gameboard.player2_current_position
				
		@opponent_start_position = @gameboard.player1_start_position
		@opponent_current_position = @gameboard.player1_current_position

		@color_pallets.each do|color_pallet|
			@player_color_bucket[color_pallet.id] = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player2_id, color_pallet.id).available_quantity
			@opponent_color_bucket[color_pallet.id] =  PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player1_id, color_pallet.id).available_quantity
		end


	end
		
	p @player_current_position
	p @opponent_current_position
	
	respond_to do|format|
		format.html {render action: "game_board", :layout => false}
	end
  end
  
  def emotion_measure
	@game_round = GameRound.find(params[:id])
	
	@player_id = session[:player_id]
	
	if Game.find(@game_round.game_id).player1_id == @player_id
		@game_round.player1_player2_emotion = params[:emotion]
	elsif Game.find(@game_round.game_id).player2_id == @player_id
		@game_round.player2_player1_emotion = params[:emotion]
	end

	@game_round.save

	respond_to do|format|
		format.html {redirect_to :controller => :players, :action => :player_game_rounds, :id => @game_round.game_id}
	end
  end
  
  def expectation_measure
	@game_round = GameRound.find(params[:id])
	
	@player_id = session[:player_id]
	
	if Game.find(@game_round.game_id).player1_id == @player_id
		@game_round.player1_player2_expectation = params[:expectation]
		@game_round.player1_status = true
		
	elsif Game.find(@game_round.game_id).player2_id == @player_id
		@game_round.player2_player1_expectation = params[:expectation]
		@game_round.player2_status = true
	end

	@game_round.save
	@gameboard = Gameboard.where("game_round_id = ?", @game_round.id)

	respond_to do|format|
		format.html {
			#redirect_to :controller => :players, :action => :player_game_board, :id => @game_round.id
			redirect_to :controller => :players, :action => :move, :game_round_id => @game_round.id, :gameboard_id => @gameboard[0].id
			}
		#format.html {render action: "player_game_board"}
	end
  end
  
  def move
  
	#@game_round_id = params[:game_round_id]
	#@game_round = GameRound.find(@game_round_id)
	#@gameboard = Gameboard.where("game_round_id = ?", @game_round_id)
	#if @gameboard.size > 0
	#	@gameboard = @gameboard[0]
	#end
	
	@direction = params[:direction]
	p @direction

	@gameboard_id = params[:gameboard_id]
	p @gameboard_id
	@gameboard = Gameboard.find(@gameboard_id)
	@gridsize = @gameboard.gridsize
	@player_id = session[:player_id]
	move_check = false
	@color_pallets = ColorPallet.all
	
	@game_round = GameRound.find(@gameboard.game_round_id)
	@game = Game.find(@game_round.game_id)

	@player_color_bucket = Hash.new
	@opponent_color_bucket = Hash.new

	
	if(@game.player1_id == @player_id)
	#@player_start_position = @gameboard.player1_start_position
		#@gameboard.player1_current_position = @new_cellnumber
		@player_current_position = @gameboard.player1_current_position
		
		#@opponent_start_position = @gameboard.player2_start_position
		@opponent_current_position = @gameboard.player2_current_position

		@color_pallets.each do|color_pallet|
			@player_color_bucket[color_pallet.id] = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player1_id, color_pallet.id).available_quantity
			@opponent_color_bucket[color_pallet.id] =  PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player2_id, color_pallet.id).available_quantity
		end

	else
		#@player_start_position = @gameboard.player2_start_position
		#@gameboard.player2_current_position = @new_cellnumber
		@player_current_position = @gameboard.player2_current_position
				
		#@opponent_start_position = @gameboard.player1_start_position
		@opponent_current_position = @gameboard.player1_current_position

		@color_pallets.each do|color_pallet|
			@player_color_bucket[color_pallet.id] = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player2_id, color_pallet.id)
			@opponent_color_bucket[color_pallet.id] =  PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player1_id, color_pallet.id)
		end		
	end
	
	@current_cellnumber = @player_current_position
	p @current_cellnumber
	
	
	if(@direction == "up")
		if((@current_cellnumber - 1) > @gameboard.gridsize)
			@new_cellnumber = @current_cellnumber - @gameboard.gridsize
			move_check = true
		end
		
	elsif(@direction == "down")
		if((@current_cellnumber- 1) < (@gameboard.gridsize * @gameboard.gridsize))
			@new_cellnumber = @current_cellnumber + @gameboard.gridsize
			move_check = true
		end
	elsif(@direction == "left")
		if((@current_cellnumber - 1)% @gameboard.gridsize != 0)
			@new_cellnumber = @current_cellnumber - 1
			move_check = true
		end
	elsif(@direction == "right")
		if((@current_cellnumber - 1) % @gameboard.gridsize != (@gameboard.gridsize - 1))
			@new_cellnumber = @current_cellnumber + 1
			move_check = true
		end
	end
		
	if move_check
	
		if(@game.player1_id == @player_id)
		#@player_start_position = @gameboard.player1_start_position
			@gameboard.player1_current_position = @new_cellnumber
			@player_current_position = @gameboard.player1_current_position
			
			#@opponent_start_position = @gameboard.player2_start_position
			@opponent_current_position = @gameboard.player2_current_position
		else
			#@player_start_position = @gameboard.player2_start_position
			@gameboard.player2_current_position = @new_cellnumber
			@player_current_position = @gameboard.player2_current_position
					
			#@opponent_start_position = @gameboard.player1_start_position
			@opponent_current_position = @gameboard.player1_current_position
		end
		@gameboard.save
	end
	
	#player_communications
	@player_communications = PlayerCommunication.where("game_round_id = ?", @game_round.id)
	
	
	respond_to do|format|
		#format.html {redirect_to :controller => :players, :action => :player_game_board, :id => @game_round.id}
		#format.html {render action: "player_game_board", :layout => false}
		format.html {render action: "player_game_board"}
		#format.html {render action: "game_board"}
	end
	
  end
  
  def moveajax
	@direction = params[:direction]
	p @direction

	@gameboard_id = params[:gameboard_id]
	p @gameboard_id
	@gameboard = Gameboard.find(@gameboard_id)
	@gridsize = @gameboard.gridsize
	@player_id = session[:player_id]
	@color_pallets = ColorPallet.all
	
	@game_round = GameRound.find(@gameboard.game_round_id)
	@game = Game.find(@game_round.game_id)

	@player_color_bucket = Hash.new
	@opponent_color_bucket = Hash.new

	
	if(@game.player1_id == @player_id)
	#@player_start_position = @gameboard.player1_start_position
		#@gameboard.player1_current_position = @new_cellnumber
		@player_current_position = @gameboard.player1_current_position
		
		#@opponent_start_position = @gameboard.player2_start_position
		@opponent_current_position = @gameboard.player2_current_position

		@color_pallets.each do|color_pallet|
			@player_color_bucket[color_pallet.id] = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player1_id, color_pallet.id).available_quantity
			@opponent_color_bucket[color_pallet.id] =  PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player2_id, color_pallet.id).available_quantity
		end

	else
		#@player_start_position = @gameboard.player2_start_position
		#@gameboard.player2_current_position = @new_cellnumber
		@player_current_position = @gameboard.player2_current_position
				
		#@opponent_start_position = @gameboard.player1_start_position
		@opponent_current_position = @gameboard.player1_current_position

		@color_pallets.each do|color_pallet|
			@player_color_bucket[color_pallet.id] = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player2_id, color_pallet.id).available_quantity
			@opponent_color_bucket[color_pallet.id] =  PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, @game.player1_id, color_pallet.id).available_quantity
		end		
	end
	
	@current_cellnumber = @player_current_position
	p @current_cellnumber
	
	
	if(@direction == "up")
		if((@current_cellnumber - 1) > @gameboard.gridsize)
			@new_cellnumber = @current_cellnumber - @gameboard.gridsize
			move_check = true
		end
		
	elsif(@direction == "down")
		if((@current_cellnumber- 1) < (@gameboard.gridsize * @gameboard.gridsize))
			@new_cellnumber = @current_cellnumber + @gameboard.gridsize
			move_check = true
		end
	elsif(@direction == "left")
		if((@current_cellnumber - 1)% @gameboard.gridsize != 0)
			@new_cellnumber = @current_cellnumber - 1
			move_check = true
		end
	elsif(@direction == "right")
		if((@current_cellnumber - 1) % @gameboard.gridsize != (@gameboard.gridsize - 1))
			@new_cellnumber = @current_cellnumber + 1
			move_check = true
		end
	end
		
	if move_check
	
		#new_cellcolor = Cellcolor.where(gameboard_id: @gameboard.id, cellnumber: @new_cellnumber -1).take
		#new_cellcolor = Cellcolor.where("gameboard_id = ? AND cellnumber = ?", @gameboard.id, @new_cellnumber-1).take(1)
		new_cellcolor = Cellcolor.find_by_gameboard_id_and_cellnumber(@gameboard.id, @new_cellnumber-1)
		#new_cellcolors = Cellcolor.where("gameboard_id = ?", @gameboard.id)
		p "NEW CELLCOLOR"
		p new_cellcolor.color_pallet_id
		
		#p "NEW CELLCOLORS"
		#p new_cellcolors

		
		#player_color_bucket = PlayerColorBucket.where(game_round_id: @gameboard.game_round_id, player_id: session[:player_id], color_pallet_id: new_cellcolor.color_pallet_id).take
		player_color_bucket = PlayerColorBucket.find_by_game_round_id_and_player_id_and_color_pallet_id(@gameboard.game_round_id, session[:player_id], new_cellcolor.color_pallet_id)

		p player_color_bucket

		if player_color_bucket != nil and player_color_bucket.available_quantity > 0	
			if(@game.player1_id == @player_id)
			#@player_start_position = @gameboard.player1_start_position
				@gameboard.player1_current_position = @new_cellnumber
				@player_current_position = @gameboard.player1_current_position
				
				#@opponent_start_position = @gameboard.player2_start_position
				@opponent_current_position = @gameboard.player2_current_position
			else
				#@player_start_position = @gameboard.player2_start_position
				@gameboard.player2_current_position = @new_cellnumber
				@player_current_position = @gameboard.player2_current_position
						
				#@opponent_start_position = @gameboard.player1_start_position
				@opponent_current_position = @gameboard.player1_current_position
			end
			@gameboard.save
			
			player_color_bucket.available_quantity -= 1
			player_color_bucket.save
			@player_color_bucket[player_color_bucket.color_pallet_id] -= 1
		end
	end
	
	#player_communications
	@player_communications = PlayerCommunication.where("game_round_id = ?", @game_round.id)
	
	
	respond_to do|format|
		#format.html {redirect_to :controller => :players, :action => :player_game_board, :id => @game_round.id}
		#format.html {render action: "player_game_board", :layout => false}
		#format.html {render action: "player_game_board"}
		format.html {render action: "game_board", :layout => false}
	end  
	
  end
  
  def player_communication
	p "In Player Communications"
	#@game_round = GameRound.find(params[:game_round_id])
	#@game = Game.find(@game_round.game_id)
	#@player = Player.find(params[:player_id])
	#@opponent = Player.find(params[:opponent_id])
	@gameboard = Gameboard.find(params[:gameboard_id])
	@player_communications = PlayerCommunication.where("game_round_id = ?", @gameboard.game_round_id)
	#@player_communication = PlayerCommunication.new
	
	respond_to do|format|
		format.html {render action: "player_communication", :layout => false}
	end
  end
  
  def create_player_communication
	@player_communication = PlayerCommunication.new
	@player_communication.player_id = params[:player_id]
	@player_communication.game_round_id = Gameboard.find(params[:gameboard_id]).game_round_id
	@player_communication.message = params[:message]
	@player_communication.save
	
	@gameboard = Gameboard.find(params[:gameboard_id])
	@player_communications = PlayerCommunication.where("game_round_id = ?", @gameboard.game_round_id)
	
	respond_to do|format|
		format.html {render action: "player_communication", :layout => false}
	end
	
  end

  def transfer_resource_form
  	#@game = Game.find(params[:id])
	#@moods = Mood.all
	@color_pallets = ColorPallet.all
	
	
	respond_to do|format|
		format.html {render action: "transfer_resource_form"}
	end

  end

  def transfer_resource
  	color_pallet_id = params[:color_pallet_id]
  	quantity = params[:quantity].to_i
  	#opponent_id = params[:opponent_id]
  	game_round_id = params[:game_round_id]
  	gameboard_id = params[:gameboard_id]

  	game = Game.find(params[:game_id])

  	player_id = session[:player_id]

  	if game.player1_id == player_id
  		opponent_id = game.player2_id
  	else
  		opponent_id = game.player1_id
  	end


  	player_color_bucket = PlayerColorBucket.find_by_player_id_and_color_pallet_id_and_game_round_id(player_id, color_pallet_id,game_round_id)

  	if quantity > 0 and player_color_bucket.available_quantity >= quantity

		opponent_color_bucket = PlayerColorBucket.find_by_player_id_and_color_pallet_id_and_game_round_id(opponent_id, color_pallet_id,game_round_id)
  		opponent_color_bucket.available_quantity += quantity
  		opponent_color_bucket.save

  		player_color_bucket.available_quantity -= quantity
  		player_color_bucket.save

	  	player_communication = PlayerCommunication.new
	  	player_communication.player_id = session[:player_id]
	  	player_communication.game_round_id = game_round_id
	  	player_communication.message = "#{Player.find(player_id).name} transferred #{quantity} #{ColorPallet.find(color_pallet_id).name} to #{Player.find(opponent_id).name}"
	  	player_communication.save

	  	transfer_resource = TransferResource.new
	  	transfer_resource.game_round_id = game_round_id
	  	transfer_resource.player_id = session[:player_id]
	  	transfer_resource.opponent_id = opponent_id
	  	transfer_resource.color_pallet_id = color_pallet_id
	  	transfer_resource.quantity = quantity
	  	transfer_resource.save
  	end

  	#@gameboard = Gameboard.find(params[:gameboard_id])
	@player_communications = PlayerCommunication.where("game_round_id = ?", @game_round_id)


  	respond_to do|format|
		format.html {render action: "player_communication", :layout => false}
	end

  end
  
end
