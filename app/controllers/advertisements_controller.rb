class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
    #responsibilty of index action?
  end

  def show
    @advertisement = Advertisement.find(params[:id])
    #responsibilty of show action?
  end
end
