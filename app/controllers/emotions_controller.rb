class EmotionsController < ApplicationController
  # GET /emotions
  # GET /emotions.json
  def index
    @emotions = Emotion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emotions }
    end
  end

  # GET /emotions/1
  # GET /emotions/1.json
  def show
    @emotion = Emotion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @emotion }
    end
  end

  # GET /emotions/new
  # GET /emotions/new.json
  def new
    @emotion = Emotion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @emotion }
    end
  end

  # GET /emotions/1/edit
  def edit
    @emotion = Emotion.find(params[:id])
  end

  # POST /emotions
  # POST /emotions.json
  def create
    @emotion = Emotion.new(params[:emotion])

    respond_to do |format|
      if @emotion.save
        format.html { redirect_to @emotion, notice: 'Emotion was successfully created.' }
        format.json { render json: @emotion, status: :created, location: @emotion }
      else
        format.html { render action: "new" }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emotions/1
  # PUT /emotions/1.json
  def update
    @emotion = Emotion.find(params[:id])

    respond_to do |format|
      if @emotion.update_attributes(params[:emotion])
        format.html { redirect_to @emotion, notice: 'Emotion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emotions/1
  # DELETE /emotions/1.json
  def destroy
    @emotion = Emotion.find(params[:id])
    @emotion.destroy

    respond_to do |format|
      format.html { redirect_to emotions_url }
      format.json { head :no_content }
    end
  end
end
