class AccountsController < ApplicationController
	def index
    @accounts = Account.all
  end


  def show
    @account = Account.find(params[:id])
  end


  def new
    @account = Account.new
  end


  def edit
    @account = Account.find(params[:id])
  end


  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      redirect_to new_accounts_path
    end
  end



  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to accounts_path
    else
      "error"
    end
  end


  def destroy
    @account = Account.find(params[:id])
    if @account.destroy
      redirect_to accounts_path
    else
      "error"
    end
  end
  
  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit!
  end

end
