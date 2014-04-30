class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end


  def show
    @transaction = Transaction.find(params[:id])
  end


  def new
    @new_transaction = Transaction.new
  end


  def edit
    @transaction = Transaction.find(params[:id])
  end


  def create
    @new_transaction = Transaction.new(transaction_params)
    if @new_transaction.save
      redirect_to transactions_path
    else
      redirect_to new_transactions_path
    end
  end

  def search
    @transactions = (Transaction.search(params[:search])).order(params[:sort])
    render :index
  end


  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to transactions_path
    else
      "error"
    end
  end


  def destroy
    @transaction = Transaction.find(params[:id])
    if @transaction.destroy
      redirect_to transactions_path
    else
      "error"
    end
  end
  
  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit!
  end

end
