class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @day_record =@user.incomes.group("DATE(start_time)")
    @income = Income.includes(:user).order(start_time:"ASC")
    @incomes = Income.where(start_time: Time.now.beginning_of_month..Time.now.end_of_month).includes(:user).order(start_time: "ASC")
    @income_sum = @incomes.sum(:income_price)
  end
end
