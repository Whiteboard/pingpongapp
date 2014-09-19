class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
    @leagueusers = League.find(params[:league_id]).users
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @leagueusers = League.find(params[:league_id]).users
    @games = Game.where("match_id =?", params[:id])
  end

  # GET /matches/new
  def new
    @match = League.find(params[:league_id]).matches.new
    @leagueusers = League.find(params[:league_id]).users.where.not(id: current_user.id)
  end

  # GET /matches/1/edit
  def edit
     @leagueusers = League.find(params[:league_id]).users.where.not(id: current_user.id)
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = League.find(params[:league_id]).matches.new(match_params)
    player_one = current_user.id
    respond_to do |format|
      if @match.save
        format.html { redirect_to league_match_path(@match.league_id, @match.id), notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:player_one, :player_two)
    end
end
