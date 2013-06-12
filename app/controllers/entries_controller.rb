class EntriesController < ApplicationController
  def index
    @entries = Entry.limit(100)
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
