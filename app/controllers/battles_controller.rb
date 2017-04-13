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
    @map = Map.find_by_id(params[:map_id])
    @mGroup = @map.monsters
    ## skip out if error
    if (@user && @monster)
      fight
    elsif (@user && @mGroup.count>1)
      @mGroup.each do |monster|
        @monster = monster
        fight
      end
    else
      puts "no user or monster"
      redirect_back(fallback_location: maps_path)
    end
  end
  def fight
    @battle = @user.battles.create()
    @battle.userBefore = @user.to_json
    @battle.monsterBefore = @monster.to_json

    fight_detail
    
    ## user win 
    if(@monster.hp <= 0)
      @battle.status = "win"
      exp = calc_exp(@user.lvl, @monster.lvl)
      message =  "user win, gain #{exp}"
      @user.exp += exp
      message = message + "\n" + @user.lvl_up.to_s
      @user.hp = @user.maxhp
      @user.save
      @monster.destroy
    ## user die
    elsif(@user.hp <= 0)
      ## penalty
      @battle.status = "lost"
      exp = calc_exp(@user.lvl, @monster.lvl)
      message =  "user lost, lost #{exp}"
      @user.exp -= exp
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
      battleline = @battle.battlelines.create(utext: @user.to_json, mtext: @monster.to_json)
    end

    def calc_exp(ulvl,mlvl)
      d = mlvl - ulvl
      e = 0
      if d <= -5
        e = 0
      elsif d == -4
        e = 1
      elsif d == -3
        e = 4
      elsif d == -2
        e = 7
      elsif d == -1
        e = 9
      elsif d == 0
        e = 10
      elsif d == 1
        e = 11
      elsif d == 2
        e = 13
      elsif d == 3
        e = 16
      elsif d == 4
        e = 19
      elsif d >= 5
        e = 20 
      end
      e = e*10
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end


  
end
