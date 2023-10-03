class Api::SessionsController < ApplicationController
  def create
    
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end