class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weapons }
    end
  end

  def show
    @weapon = Weapon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weapon }
    end
  end
end
