class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skills }
    end
  end

end
