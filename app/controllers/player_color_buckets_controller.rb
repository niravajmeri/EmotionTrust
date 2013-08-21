class PlayerColorBucketsController < ApplicationController
  # GET /player_color_buckets
  # GET /player_color_buckets.json
  def index
    @player_color_buckets = PlayerColorBucket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_color_buckets }
    end
  end

  # GET /player_color_buckets/1
  # GET /player_color_buckets/1.json
  def show
    @player_color_bucket = PlayerColorBucket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_color_bucket }
    end
  end

  # GET /player_color_buckets/new
  # GET /player_color_buckets/new.json
  def new
    @player_color_bucket = PlayerColorBucket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_color_bucket }
    end
  end

  # GET /player_color_buckets/1/edit
  def edit
    @player_color_bucket = PlayerColorBucket.find(params[:id])
  end

  # POST /player_color_buckets
  # POST /player_color_buckets.json
  def create
    @player_color_bucket = PlayerColorBucket.new(params[:player_color_bucket])

    respond_to do |format|
      if @player_color_bucket.save
        format.html { redirect_to @player_color_bucket, notice: 'Player color bucket was successfully created.' }
        format.json { render json: @player_color_bucket, status: :created, location: @player_color_bucket }
      else
        format.html { render action: "new" }
        format.json { render json: @player_color_bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_color_buckets/1
  # PUT /player_color_buckets/1.json
  def update
    @player_color_bucket = PlayerColorBucket.find(params[:id])

    respond_to do |format|
      if @player_color_bucket.update_attributes(params[:player_color_bucket])
        format.html { redirect_to @player_color_bucket, notice: 'Player color bucket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_color_bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_color_buckets/1
  # DELETE /player_color_buckets/1.json
  def destroy
    @player_color_bucket = PlayerColorBucket.find(params[:id])
    @player_color_bucket.destroy

    respond_to do |format|
      format.html { redirect_to player_color_buckets_url }
      format.json { head :no_content }
    end
  end
end
