class ScoresController < ApplicationController
  def index
    if (params[:match_id])
      @scores = Score.where(match_id: params[:match_id]).to_a
      @heading_text = "#{@scores.first.game.name} Match "
    else
      @scores = Score.all.to_a
      @heading_text = ''
    end

    @scores.sort!
  end

  def edit
    @score = Score.find(params[:id])
  end

  def update
    @score = Score.find(params[:id])
    if (@score.update(score_params))
      redirect_to controller: :scores, action: :index, match_id: @score.match.id
    else
      render "edit"
    end
  end

  private
  def score_params
    params.require(:score).permit(:match_id, :team_id, :score)
  end
end
