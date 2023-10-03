class Api::Teams::DepositsController < Api::Teams::BaseController
  def create
    @deposit = current_team.deposits.new(deposit_params)

    if @deposit.save
      respond_success(@deposit)
    else
      respond_form_with_error(@deposit.errors, deposit_params)
    end
  end

  private

  def deposit_params
    params.permit(:amount)
  end
end