class FmapsController < ApplicationController

  def fight()
    @user = User.find_by_id(session[:user_id])
    @monster = Monster.find_by_id(params[:monster_id])
    ## skip out if error
    if !(@user && @monster)
      redirect_back(fallback_location: maps_path)
      return
    end
    ## always win now
    @user.exp += @monster.exp
    @user.save
    @monster.destroy

    redirect_back(fallback_location: maps_path)

  end
end
