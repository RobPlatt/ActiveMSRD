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
    if (@character.description)
      @description = wikify(@character.description)
    else
      @description = ""
    end
    if (@character.armor_id)
      @armor = Armor.find(@character.armor_id)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character }
    end
  end

  def build_level(character, x)
    character_level = character.character_levels.build(:level => x)
    if x == 1
      2.times {character_level.character_level_feats.build}
    elsif x.modulo(3) == 0
      character_level.character_level_feats.build
  end

  end  
  
  # GET /characters/new
  # GET /characters/new.xml
  def new
    @character = Character.new
    Skill.all.each do |skill|
      @character.character_skills.build(:character_id => @character.id, :skill_id => skill.id)
    end
    for x in 1..20
      build_level(@character, x)
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
    # fill in any missing character skills
    Skill.all.each do |skill|
      character_skill = @character.character_skills.find_by_skill_id(skill.id)
      if (not character_skill)
        @character.character_skills.build(:character_id => @character.id, :skill_id => skill.id)
      end
    end
    
    for x in 1..20
      character_level = @character.character_levels.find_by_level(x)
      if character_level
        (character_level.num_feat_slots - character_level.character_level_feats.count).times {
          character_level.character_level_feats.create }
      else
        build_level(@character, x)
      end
    end
    
  end

  # POST /characters
  # POST /characters.xml
  def create
    @character = Character.new(params[:character])
    
    respond_to do |format|
      if @character.save
        format.html { redirect_to(@character, :notice => 'Character was successfully created.') }
        format.xml  { render :xml => @character, :status => :created, :location => @character }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.xml
  def update
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(@character, :notice => 'Character was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.xml
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end

end
