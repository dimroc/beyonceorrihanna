class VotesController < ApplicationController
  respond_to :html, :js

  def create
    rivalry_character = RivalryCharacter.find(params[:rivalry_character_id])
    Vote.create(rivalry_character: rivalry_character, ip: request.remote_ip)

    render nothing: true
  end
end