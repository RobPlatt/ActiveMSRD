class CharactersController < ApplicationController
  def index
    @characters = Character.all
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end

  def show
    @character = Character.find(params[:id])
    @skills = Skill.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character }
    end
  end

end
