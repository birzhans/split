class BillsController < ApplicationController

  def index
    @bills = current_user.bills
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @bill = Bill.new
    @bill.line_items.build
  end

  def create
    @bill = current_user.bills.new(bill_params)

    if @bill.save
      redirect_to @bill
    else
      render_errors(@bill)
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to bills_path
  end

  private

  def bill_params
    params.require(:bill).permit(
      :payer_name, :description, :total, 
      line_items_attributes: [:id, :description, :total, :_destroy]
    )
  end
end