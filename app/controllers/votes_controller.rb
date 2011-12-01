class VotesController < ApplicationController
  respond_to :html, :js

  def create
    entry = Entry.find(params[:entry_id])
    Vote.create(entry: entry, ip: request.remote_ip)

    render nothing: true
  end
end