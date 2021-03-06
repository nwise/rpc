class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.completed

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js { render :update_game_view, :layout => false}
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit  
    @game = Game.find(params[:id])
    if @game.complete?
      render :show
    elsif @game.player1 != current_player
      @game.update_attributes(:player2 => current_player)
      @game.reload      
    end
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(:player1 => current_player)
    respond_to do |format|
      if @game.save
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to(edit_game_url(@game)) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end

  def update_game_view
    @game = Game.find(params[:id])
    #render :nothing => true
    if @game.complete?
      redirect_to (game_url(@game))
    end
  end
end
