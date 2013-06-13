class BunchesController < ApplicationController
  before_action :set_bunch, only: [:show, :edit, :update, :destroy]

  # GET /bunches
  # GET /bunches.json
  def index
    @bunches = Bunch.all
  end

  # GET /bunches/1
  # GET /bunches/1.json
  def show
  end

  # GET /bunches/new
  def new
    @bunch = Bunch.new
  end

  # GET /bunches/1/edit
  def edit
  end

  # POST /bunches
  # POST /bunches.json
  def create
    @bunch = Bunch.new(bunch_params)

    respond_to do |format|
      if @bunch.save
        format.html { redirect_to @bunch, notice: 'Bunch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bunch }
      else
        format.html { render action: 'new' }
        format.json { render json: @bunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bunches/1
  # PATCH/PUT /bunches/1.json
  def update
    respond_to do |format|
      if @bunch.update(bunch_params)
        format.html { redirect_to @bunch, notice: 'Bunch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bunches/1
  # DELETE /bunches/1.json
  def destroy
    @bunch.destroy
    respond_to do |format|
      format.html { redirect_to bunches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bunch
      @bunch = Bunch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bunch_params
      params.require(:bunch).permit(:landing, :tag_list)
    end
end
