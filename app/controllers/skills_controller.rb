class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skills }
    end
  end
  
  def show
    @skill = Skill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @skill }
    end
  end

end
