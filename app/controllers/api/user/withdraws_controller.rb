class Api::User::WithdrawsController < ApplicationController
  before_action :authenticate_user!

  def create
    @withdraw = current_user.withdraws.new(withdraw_params)

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