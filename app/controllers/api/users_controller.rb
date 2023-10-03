class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    respond_success({
      email: current_user.email,
      current_balance: current_user.current_balance
    })
  end
end