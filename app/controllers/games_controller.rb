class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if (@game.save)
      flash[:success] = "Game saved successfully."
      redirect_to :games
    else
      flash[:error] = "Game could not be saved."
      render "new"
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if (@game.update(game_params))
      flash[:success] = "Game saved successfully."
      redirect_to :games
    else
      flash[:error] = "Game could not be saved."
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if (@game.destroy)
      flash[:success] = "Game deleted successfully."
      redirect_to :games
    else
      flash[:error] = "Game could not be deleted."
      render "show"
    end
  end

  def generate_round_robin
    @game = Game.find(params[:id])
    @teams = Team.all
    @matches = []
    (0...@teams.length).each do |i|
      (i+1...@teams.length).each do |j|
        @matches << Match.new(game_id: @game.id, team_ids: [@teams[i].id, @teams[j].id])
      end
    end

    succeeded = 0
    failed = 0
    @matches.each do |m|
      if (m.save)
        succeeded += 1
      else
        failed += 1
      end
    end

    if ( failed == 0 && succeeded > 0 )
      flash[:success] = "Yay! All matches created successfully."
    elsif ( succeeded == 0 && failed > 0 )
      flash[:error] = "Sorry, no matches could be saved."
    else
      flash[:warning] = "Hmmm... #{succeeded} matches were created, but #{failed} matches failed to be created."
    end

    redirect_to :matches
  end

  def generate_with_all
    @game = Game.find(params[:id])
    @teams = Team.all
    @match = Match.new(game_id: @game.id, team_ids: @teams.map { |t| t.id })
    if (@match.save)
      flash[:success] = "Match created successfully."
    else
      flash[:error] = "Sorry, that match could not be created."
    end

    redirect_to :matches
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
