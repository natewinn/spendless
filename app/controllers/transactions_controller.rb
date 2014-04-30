class TransactionController < ApplicationController

  def index
    @transaction = Transaction.all
  end


  def show
    @transaction = Transaction.find(params[:id])
  end


  def new
    @transaction = Transaction.new
  end


  def edit
    @transaction = Transaction.find(params[:id])
  end


  def create
    @transaction = Transaction.new(transaction_params)
  end


  def update
    if @transaction.update(transaction_params)
      redirect transactions_path
    else
      "error"
    end
  end


  def destroy
    if @transaction.destroy
      redirect transactions_path
    else
      "error"
    end
  end
  
  private

  def set_budget
    @transaction = Transaction.find(params[:id])
  end

  def budget_params
    params.require(:transaction).permit!
  end

end
