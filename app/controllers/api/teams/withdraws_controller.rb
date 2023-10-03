class Api::Teams::WithdrawsController < Api::Teams::BaseController
  def create
    @withdraw = current_team.withdraws.new(withdraw_params)

    if @withdraw.save
      respond_success(@withdraw)
    else
      respond_form_with_error(@withdraw.errors, withdraw_params)
    end
  end

  private

  def withdraw_params
    params.permit(:amount)
  end
end