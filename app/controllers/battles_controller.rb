class BattlesController < ApplicationController
  # speed increase to @@trig to attack
  @@trig = 40
  before_action :set_battle, only: [:show]

  def index
    @user = User.find_by_id(session[:user_id])
    @maps = Map.all
  end

  def new
    @user = User.find_by_id(session[:user_id])
    @monster = Monster.find_by_id(params[:monster_id])
    ## skip out if error
    if !(@user && @monster)
      puts "no user or monster"
      redirect_back(fallback_location: maps_path)
      return
    end
    @battle = @user.battles.create()
    @battle.userBefore = @user.to_json
    @battle.monsterBefore = @monster.to_json

    fight_detail
    
    ## user win 
    if(@monster.hp <= 0)
      @battle.status = "win"
      message =  "user win, gain #{@monster.exp}"
      @user.exp += @monster.exp
      @user.hp = @user.maxhp
      @user.save
      @monster.destroy
    ## user die
    elsif(@user.hp <= 0)
      ## penalty
      @battle.status = "lost"
      message =  "user lost, lost #{@monster.exp}"
      @user.exp -= @monster.exp
      @user.hp = @user.maxhp
      @user.save
    else
      ##
      message =  "draw"
      @battle.status = message
    end
    
    @battle.userAfter = @user.to_json
    @battle.monsterAfter = @monster.to_json
    flash.now[:notice] = message
    puts message

    @battle.save()
  end

  def show
  end
  private

  def fight_detail
    @user.trig = 0
    @monster.trig = 0
    ## roll_first, random first now
    if rand(0..1) == 1
      @user.trig += @@trig
    else
      @monster.trig += @@trig
    end
    
    ## max 100 round
    1000.times do |t|
      return if(@user.hp<=0 || @monster.hp<=0)
      if(@user.trig >= @@trig)
        damage = @user.atk - @monster.def
        damage = 1 if damage <= 0
        @monster.hp -= damage
        @user.trig -= @@trig
        save_detail_log
      elsif(@monster.trig >= @@trig)
        damage =  @monster.atk - @user.def
        damage = 1 if damage <= 0
        @user.hp -= damage
        @monster.trig -= @@trig
        save_detail_log
      else
        @user.trig += @user.speed
        @monster.trig += @monster.speed
      end
    end
  end

  private
    def save_detail_log
      battleline = @battle.battlelines.create()
      battleline.utext = @user.to_json
      battleline.mtext = @monster.to_json
      battleline.save
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end


  
end