class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index
    @budgets = Budget.all
  end


  def show
    @budget = Budget.find(params[:id])
  end


  def new
    @budget = Budget.new
  end


  def edit
    @budget = Budget.find(params[:id])
  end


  def create
    @budget = Budget.new(budget_params)
  end


  def update
    if @budget.update(budget_params)
      redirect budgets_path
    else
      "error"
    end
  end


  def destroy
    if @budget.destroy
      redirect budgets_path
    else
      "error"
    end
  end
  
  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit!
  end

end