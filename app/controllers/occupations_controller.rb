class OccupationsController < ApplicationController
  def index
    @occupations = Occupation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occupations }
    end
  end

  def show
    @occupation = Occupation.find(params[:id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @occupation }
    end
  end

end
