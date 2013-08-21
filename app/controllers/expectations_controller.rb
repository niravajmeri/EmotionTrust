class ExpectationsController < ApplicationController
  # GET /expectations
  # GET /expectations.json
  def index
    @expectations = Expectation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expectations }
    end
  end

  # GET /expectations/1
  # GET /expectations/1.json
  def show
    @expectation = Expectation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expectation }
    end
  end

  # GET /expectations/new
  # GET /expectations/new.json
  def new
    @expectation = Expectation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expectation }
    end
  end

  # GET /expectations/1/edit
  def edit
    @expectation = Expectation.find(params[:id])
  end

  # POST /expectations
  # POST /expectations.json
  def create
    @expectation = Expectation.new(params[:expectation])

    respond_to do |format|
      if @expectation.save
        format.html { redirect_to @expectation, notice: 'Expectation was successfully created.' }
        format.json { render json: @expectation, status: :created, location: @expectation }
      else
        format.html { render action: "new" }
        format.json { render json: @expectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expectations/1
  # PUT /expectations/1.json
  def update
    @expectation = Expectation.find(params[:id])

    respond_to do |format|
      if @expectation.update_attributes(params[:expectation])
        format.html { redirect_to @expectation, notice: 'Expectation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expectations/1
  # DELETE /expectations/1.json
  def destroy
    @expectation = Expectation.find(params[:id])
    @expectation.destroy

    respond_to do |format|
      format.html { redirect_to expectations_url }
      format.json { head :no_content }
    end
  end
end
