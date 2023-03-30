class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes = current_user.incomes
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


  def destroy
    income = Income.find(params[:id])
    income.destroy
    redirect_to root_path
  end



  private

  def income_params
    params.require(:income).permit(:start_time, :income_price, :memo, :category).merge(user_id: current_user.id)
  end

end