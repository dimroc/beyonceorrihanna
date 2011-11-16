class Admin::CharactersController < ApplicationController
  before_filter :authorize
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
    character = Character.create(params[:character])
    redirect_to character_path character
  end

  def update
    character = Character.find_by_id params[:id]
    character.name = params[:character][:name]
    character.save
    redirect_to character_path character
  end
end
