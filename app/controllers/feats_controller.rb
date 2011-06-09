class FeatsController < ApplicationController
  def index
    @feats = Feat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feats }
    end
  end

  def show
    @feat = Feat.find(params[:id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feat }
    end
  end

end
