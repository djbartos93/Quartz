class PlayersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_player, only: [:show, :edit, :update, :destroy]

  before_action only: [:update] do
    verify_player(player_params)
  end


  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    @player.update(uuid: "#{@mcuuid}")
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def verify_player(player_params)
    puts "THIS IS THE PLAYER ID #{@player.id}"
    puts "THIS IS THE PLAYERS USERNAME #{player_params[:username]}"
    @username = player_params[:username].to_s
    mojangAPI(@username)
    puts @mcuuid.to_s
    if @mcuuid.nil? || @mcuuid.empty?
      puts "ITS EMPTY!"
    else
      puts "GOT A UUID!"
    end
  end

  private

  def mojangAPI(username)
    puts "MC USER INPUT:#{username}"
    url = "https://api.mojang.com/users/profiles/minecraft/#{username}"
    uri = URI(url)
    response_raw = Net::HTTP.get(uri)
    if response_raw.nil? || response_raw.empty?
      puts "INVALID RESPONSE"
    else
      response = response_raw
    @mcuuid = JSON.parse(response)["id"]
    puts "MC UUID FROM MOJANG IS #{@mcuuid}"
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:username, :uuid, :user_enabled, :admin_disabled)
    end
end
