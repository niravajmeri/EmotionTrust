class ColortrailsController < ApplicationController

  def index
  
	#@game_id = Game.find_by_id(1)
	@game_round_id = params[:id]
	
	@game_round = GameRound.find(params[:id])
	
    #@color_pallet = ['#CC0000', '#00CC00', '#0000CC', '#CCCC00', '#00CCCC']
	@color_pallet = ColorPallet.all
	@color_pallet_count = Hash.new
	
	#initialize color_pallet_count
	
	#for color in 0..@color_pallet.size-1
	#	@color_pallet_count[color] = 0
	#end
	
	@color_pallet.each do|color|
		@color_pallet_count[color] = 0
	end
	
	@player_bucket_limit = 6
    @grid_size = 4
	
	#Grid Colors
	
	@cell_color = Array.new
	unwanted_colors = Array.new

	for row in 1..@grid_size
		for col in 1..@grid_size
			cellnum = ((row-1)*@grid_size) + (col-1)
			puts "Cellnum #{cellnum}"
			
			color = ([*0..4]  - unwanted_colors).sample
			
			if @color_pallet_count[color] == 3 
				unwanted_colors.push(color)
			end

			@cell_color[cellnum] = color
			@color_pallet_count[color] += 1

			puts "Cell_color: #{@color_pallet[@cell_color[cellnum]]}"
		end
	end
	
	# To be filled randomly
	
	@player1_color_bucket = Array.new
	@player2_color_bucket = Array.new
	
	@player1_color_bucket = [1,2,1,1,2]
	@player2_color_bucket = [2,1,1,2,1]
	
	@global_color_bucket = @player1_color_bucket + @player2_color_bucket
	
	e = [[1,2],[1,5],[2,1],[2,3],[2,6],[3,2],[3,4],[3,7],[4,3],[4,8],
		[5,1],[5,6],[5,9],[6,5],[6,7],[6,2],[6,10],[7,6],[7,8],[7,3],[7,11],[8,7],[8,4],[8,12],
		[9,5],[9,10],[9,13],[10,9],[10,11],[10,6],[10,14],[11,10],[11,12],[11,7],[11,15],[12,11],[12,8],[12,16],
		[13,9],[13,14],[13,9],[14,13],[14,15],[14,10],[15,14],[15,16],[15,11],[16,15],[16,12]]
	
	
	#Player Start Point
	
	@players = 2
	@player_position = Array.new

	#for player in 0..@players-1
	#	@player_start[player] =  1 + Random.rand(3)
	#	puts "player #{player}"
	#	p @player_start[player]
	#end
	
	@player_position[0] = 1 + Random.rand(2)
	@player_position[1] = 3 + Random.rand(2)
	while(@player_position[0] == @player_position[1])
		@player_position[1] = 1 + Random.rand(3)
	end
	
	#Goal
	
	@goal = 14 + Random.rand(2)

  end
  
  def move
	@player_current_position = @player_position[0]
	
  end
  
  
  #def find_adjacent_edges(e, node)
	
	#adjacent_edges = Array.new
	
	#e.each do |edge|
	#	if(edge[0] == node)
	#		adjacent_edge.push(edge[1])
	#	end
	#end
	
	#return adjacent_edges
  
  #end
  
  #def pathfinder(G,v)
	
	#start = player_start[0]
	#goal = @goal
	
	#discovered = Array.new
	#s = Array.new
	#s.push(v)
	
	#while !s.empty?
	#	t = s.pop
	#	if(t == goal)
	#		break
	#	end
		
	#	find_adjacent_edges(G,v).each do |adjacent_edge|
		
	#	end
		
	#end
  
  #end
  
  def show_board
	
	@game_round = GameRound.find(params[:id])
	
    #@color_pallet = ['#CC0000', '#00CC00', '#0000CC', '#CCCC00', '#00CCCC']
	#@color_pallet = ColorPallet.all
	#@color_pallet_count = Hash.new
	
	#initialize color_pallet_count
	
	#for color in 0..@color_pallet.size-1
	#	@color_pallet_count[color] = 0
	#end
	
	#@color_pallet.each do|color|
	#	@color_pallet_count[color] = 0
	#end
	
	#@player_bucket_limit = 6
    @grid_size = @game_round.gridsize
	
	#Grid Colors
	
	
	# To be filled randomly
	
	@player1_color_bucket = Array.new
	@player2_color_bucket = Array.new
	
	@player1_color_bucket = [1,2,1,1,2]
	@player2_color_bucket = [2,1,1,2,1]
	
	@global_color_bucket = @player1_color_bucket + @player2_color_bucket
	
	
	#Player Start Point
	
	@player1_position = @game_round.gameboard.player1_start_position
	@player2_position = @game_round.gameboard.player2_start_position
	
	#Goal
	
	@goal = @game_round.gameboard.goal
	
  end

end
