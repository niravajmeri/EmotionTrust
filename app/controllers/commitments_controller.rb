class CommitmentsController < ApplicationController
  # GET /commitments
  # GET /commitments.json
  def index
    @commitments = Commitment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commitments }
    end
  end

  # GET /commitments/1
  # GET /commitments/1.json
  def show
    @commitment = Commitment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commitment }
    end
  end

  # GET /commitments/new
  # GET /commitments/new.json
  def new
    @commitment = Commitment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commitment }
    end
  end

  # GET /commitments/1/edit
  def edit
    @commitment = Commitment.find(params[:id])
  end

  # POST /commitments
  # POST /commitments.json
  def create
    @commitment = Commitment.new(params[:commitment])

    respond_to do |format|
      if @commitment.save
        format.html { redirect_to @commitment, notice: 'Commitment was successfully created.' }
        format.json { render json: @commitment, status: :created, location: @commitment }
      else
        format.html { render action: "new" }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commitments/1
  # PUT /commitments/1.json
  def update
    @commitment = Commitment.find(params[:id])

    respond_to do |format|
      if @commitment.update_attributes(params[:commitment])
        format.html { redirect_to @commitment, notice: 'Commitment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commitments/1
  # DELETE /commitments/1.json
  def destroy
    @commitment = Commitment.find(params[:id])
    @commitment.destroy

    respond_to do |format|
      format.html { redirect_to commitments_url }
      format.json { head :no_content }
    end
  end
end
