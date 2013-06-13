class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update]

  # GET /entries
  # GET /entries.json
  def index
    if params[:tag]
      @entries = Entry.tagged_with(params[:tag])
      @bunch = Bunch.tagged_with(params[:tag]).first
      @neighbor_tag_list = Entry.tagged_with(params[:tag], any: true).first.tag_list.join(',')
    else
      @entries = Entry.all
    end
  end

  # GET /populars
  # GET /populars.json
  def popular
    @entries = Entry.limit(100)
    render :index
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/1/edit
  def edit
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:tag_list)
    end
end
