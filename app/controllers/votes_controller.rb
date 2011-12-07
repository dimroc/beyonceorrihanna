class VotesController < ApplicationController
  def create
    rivalry_character = RivalryCharacter.find(params[:rivalry_character_id])
    Vote.create!(rivalry_character: rivalry_character, ip: request.remote_ip)

    respond_to do |format|
      format.json { render json: { id: rivalry_character.id } }
      format.html { render nothing: true }
    end
  end
end