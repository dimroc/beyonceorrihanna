class Api::CharacterAdaptersController < ApplicationController
  before_filter :load_character_adapter, only: :show
  respond_to :json, :js

  def index
    rval = CharacterAdapter.order(:id).all.map { |c| JSON.parse(c.to_json).merge({"voted?" => c.voted?(request.remote_ip)}) }
    respond_with rval
  end

  def show
    respond_with @character_adapter
  end

  private

  def load_character_adapter
    @character_adapter = RivalryCharacter.find(params[:id]).becomes CharacterAdapter
  end
end