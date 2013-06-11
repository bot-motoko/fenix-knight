class EntryController < ApplicationController
  def index
    @entries = Entry.limit(50)
  end
end
