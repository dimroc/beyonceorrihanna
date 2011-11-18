class CharactersController < ApplicationController
  respond_to :js, :html

  def show
    @character = Character.find_by_slug(params[:id])
  end
end
