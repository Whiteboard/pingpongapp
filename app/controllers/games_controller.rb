class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.where("match_id =?", params[:match_id])
    @games = Game.where("match_id =?", params[:id])
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
    @gameinfo = Match.find(params[:match_id])
  end

  # GET /games/1/edit
  def edit
    @gameinfo = Match.find(params[:match_id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        if @game.match.p1score == 2 || @game.match.p2score == 2
          if @game.match.p1score > @game.match.p2score
            @game.match.match_winner = @game.player_one_id 
            @game.match.save
          else 
            @game.match.match_winner = @game.player_two_id
            @game.match.save  
          end
        end
        format.html { redirect_to league_match_path(@game.match.league_id, @game.match_id), notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:player_one_id, :player_one_score, :player_two_id, :player_two_score, :match_id)
    end
end
