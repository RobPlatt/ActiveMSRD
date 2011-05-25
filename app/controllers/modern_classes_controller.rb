class ModernClassesController < ApplicationController
  def index
    @modern_classes = ModernClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @modern_classes }
    end
  end

  def show
    @modern_class = ModernClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @modern_class }
    end
  end

end
