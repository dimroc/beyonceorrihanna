class CharactersController < ApplicationController
  respond_to :js, :html, :json

  def index
    respond_with Character.all
  end

  def show
    @character = Character.find_by_slug(params[:id])
  end
end