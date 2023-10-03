class Api::Teams::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_team!

  attr_reader :current_team

  private

  def authenticate_team!
    authenticate_team_with_team_id || user_not_authorized
  end

  def authenticate_team_with_team_id
    @current_team = current_user.teams.find_by_id(params[:team_id])
  end
end