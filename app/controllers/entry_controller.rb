class EntryController < ApplicationController
  def index
    @entries = Entry.limit(100)
  end
end
