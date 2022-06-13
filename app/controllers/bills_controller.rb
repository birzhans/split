class BillsController < ApplicationController

  def index
    @bills = current_user.bills
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = current_user.bills.new(bill_params)

    if @bill.save
      redirect_to bills_path
    else
      render_errors(@bill)
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:payer_name, :description, :total)
  end
end