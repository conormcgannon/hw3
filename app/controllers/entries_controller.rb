class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entries = Entry.where({ "place_id" => params["place_id"] })
  end

  def new
  end

  def create
    entry = Entry.new
    entry["title"] = params["title"]
    entry["description"] = params["description"]
    entry["date"] = params["date"]

    if params["place_id"].present?
      entry["place_id"] = params["place_id"]
    end

    if entry.save
      redirect_to "/places/#{entry["place_id"]}"
    else
      render "new"
    end
  end
end
