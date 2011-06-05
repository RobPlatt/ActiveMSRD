class ArmorsController < ApplicationController
  def index
    @armors = Armor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @armors }
    end
  end

  def show
    @armor = Armor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @armor }
    end

  end

end
