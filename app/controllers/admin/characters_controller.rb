class Admin::CharactersController < ApplicationController
  before_filter :authorize, :admin_authorize
  respond_to :js, :html

  def index
    @characters = Character.all
  end

  def edit
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    Character.create(params[:character])
    redirect_to admin_characters_path
  end

  def update
    character = Character.find_by_slug params[:id]
    character.update_attributes(params[:character])
    redirect_to admin_characters_path
  end
end
