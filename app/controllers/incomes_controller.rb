class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes = Income.all
    @income = Income.new
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    
    if @income.save
      redirect_to new_income_path
    else
      render new_income_path
    end
  end

  private

  def income_params
    params.require(:income).permit(:start_time, :income_price, :memo, :genre, :category).merge(user_id: current_user.id)
  end

end