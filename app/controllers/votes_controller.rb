class VotesController < ApplicationController
  def create
    rivalry_character = RivalryCharacter.find(params[:rivalry_character_id])
    Vote.create!(rivalry_character: rivalry_character, ip: request.remote_ip)
    rivalry_character = rivalry_character.reload

    respond_to do |format|
      format.json { render json: { id: rivalry_character.id, votes_count: rivalry_character.votes_count } }
      format.html { render nothing: true }
    end
  end
end