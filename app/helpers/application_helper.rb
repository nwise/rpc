# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def available_games?
    Game.available.without_player(current_player).empty?
  end

  def game_result(game)
    game.tied? ? 'Tied!' : game.winner.username
  end
end
