class GamesController < ApplicationController

  get '/' do
    content_type :json
    sports = params['sport'].split(',') if params['sport']
    dates = params['date'].split(',') if params['date']
    locations = params['location'].split(',') if params['location']

    Game.joins(:team).select('"games".*, "teams"."teamName", "sport"').sport(sports).date(dates).location(locations).to_json
  end

  get '/:id' do
    content_type :json
    Game.joins(:team).select('games.*, "teams"."teamName", "sport"').find(params[:id]).to_json
  end

  get '/:id/edit' do
    content_type :json
    Game.joins(:team).select('"games".*,"teams"."id, teamName", "sports"').find(params[:id]).to_json
  end

end