class Admin::RivalriesController < ApplicationController
  before_filter :authorize, :admin_authorize

  def index
    @rivalries = Rivalry.all
  end

  def new
    @rivalry = Rivalry.new
    @characters = Character.all
  end

  def create
    character_ids = params[:rivalry][:character_ids]
    raise ActionController:RoutingError('incorrect params') unless character_ids.present?
    character_ids.reject! { |e| e.empty? }
    raise ActionController:RoutingError('incorrect params') unless character_ids.present? && character_ids.length > 1

    @rivalry = Rivalry.create!
    character_ids.each do |character_id|
      Entry.create!(character_id: character_id, rivalry: @rivalry)
    end

    redirect_to admin_rivalry_path @rivalry
  end

  def show
    @rivalry = Rivalry.find(params[:id])
  end
end