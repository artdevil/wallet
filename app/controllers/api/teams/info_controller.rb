class Api::Teams::InfoController < Api::Teams::BaseController
  def show
    respond_success({
      name: current_team.name,
      current_balance: current_team.current_balance
    })
  end
end