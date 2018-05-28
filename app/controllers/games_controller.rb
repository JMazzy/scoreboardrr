class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if (@game.save)
      redirect_to :games
    else
      render "new"
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if (@game.update(game_params))
      redirect_to :games
    else
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if (@game.destroy)
      redirect_to :games
    else
      render "show"
    end
  end

  def generate_round_robin
    @game = Game.find(params[:id])
    @teams = Team.all
    @matches = []
    (0...@teams.length).each do |i|
      (i+1...@teams.length).each do |j|
        Match.new(game_id: @game.id, team_ids: [@teams[i].id, @teams[j].id]).save
      end
    end

    redirect_to :matches
  end

  def generate_with_all
    @game = Game.find(params[:id])
    @teams = Team.all
    @match = Match.new(game_id: @game.id, team_ids: @teams.map { |t| t.id }).save

    redirect_to :matches
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
