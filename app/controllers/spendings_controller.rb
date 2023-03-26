class SpendingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spending_params)
    
    if @spending.save
      redirect_to new_spending_path
    else
      render new_spending_path
    end
  end

  private

  def spending_params
    params.require(:spending).permit(:start_time, :spending_price, :memo, :category).merge(user_id: current_user.id)
  end
end
