class Api::Teams::TransfersController < Api::Teams::BaseController
  def create
    @transfer = current_team.source_transfers.new(transfer_params)

    if @transfer.save
      respond_success(@transfer)
    else
      respond_form_with_error(@transfer.errors, transfer_params)
    end
  end

  private

  def transfer_params
    params.permit(:amount, :target_type, :target_id)
  end
end