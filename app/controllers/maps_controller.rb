class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :add_mtype, :remove_mtype, :create_m, :create_m_by_type]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_m_by_type()
    each_count = (params[:count] || 1).to_i
    mtype = Mtype.find( params[:mtype])
    each_count.times  do |time|
      monster = mtype.monsters.create()
      @map.monsters << monster
    end
    redirect_back(fallback_location: @map)
  end

  def create_m()
    each_count = (params[:count] || 1).to_i
    mtypes = @map.mtypes
    mtypes.each do |mtype|
      each_count.times  do |time|
        monster = mtype.monsters.create()
        @map.monsters << monster
      end
    end
    redirect_back(fallback_location: @map)
  end
    
  def add_mtype()
    mtype = Mtype.find(params[:mtype])
    @map.mtypes << mtype
    redirect_back(fallback_location: maps_path)
  end

  def remove_mtype()
    mtype = Mtype.find(params[:mtype])
    @map.mtypes.delete mtype
    @map.monsters.where(mtype_id: mtype.id).delete_all()
    redirect_back(fallback_location: maps_path)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:name, :type, :size)
    end
end
