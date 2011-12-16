class CharactersController < ApplicationController
  respond_to :js, :html, :json

  def index
    respond_with Character.all
  end

  def show
    begin
      id = Integer(params[:id])
      @character = Character.find(id)
    rescue ArgumentError
      @character = Character.find_by_slug(params[:id])
    end

    respond_with @character
  end
end