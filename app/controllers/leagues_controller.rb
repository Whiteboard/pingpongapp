class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]
  
  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @leaguemembers = League.find(params[:id]).users
    @matches = Match.where(:league_id => params[:id])
    
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  def join
  end

  def join_league
    @leagues = League.all
    return unless params[:join]
    
    uid = params['user_id']
    ln = params['join']['league_name']
    lpw = params['join']['league_password']

    @league = League.where(:league_name => ln, :league_password => lpw).first
    @already_member = LeagueUser.where(:user_id => uid, :league_id => @league_id)
    if @league
      if @already_member.count > 0
        redirect_to join_leagues_path, :notice => 'You are already added to this league'
      else
        @newuser = LeagueUser.create(:user_id => uid, :league_id => @league.id)
        redirect_to @league
      end
    else 
      flash[:notice] = 'Wrong Credentials'
      render :join
    end

  end
  # POST /leagues
  # POST /leagues.json
  def create
    ln = params['league']['league_name']
    admin_id = params['league']['admin_id']

    @leagues = League.where(:league_name => ln).first

    if @leagues
      redirect_to new_league_path, :notice => 'This league already exists, please choose a different league name'
    else
      @league = League.new(league_params)
      
      respond_to do |format|
        if @league.save
          @newuser = LeagueUser.create(:user_id => admin_id, :league_id => @league.id)
          format.html { redirect_to @league, notice: 'League was successfully created.' }
          format.json { render :show, status: :created, location: @league }
        else
          format.html { render :new }
          format.json { render json: @league.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:admin_id, :league_name, :league_id, :league_password)
    end
end
