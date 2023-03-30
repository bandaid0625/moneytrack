class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # それぞれのuserに紐付いたspendingとincome
    @spendings = current_user.spendings
    @incomes = current_user.incomes
    # 今ログインしているユーザー
    @user = User.find(current_user.id)
    # 今月のincomeとspending
    @income_month = current_user.incomes.where(start_time: Time.now.beginning_of_month..Time.now.end_of_month)
    @spendings_month = current_user.spendings.where(start_time: Time.now.beginning_of_month..Time.now.end_of_month)
    # 今月のincomeの合計とspendingの合計
    @income_sum = @incomes.sum(:income_price)
    @spending_sum = @spendings.sum(:spending_price)
    
    if @income_month.present? || @spendings_month.present?
      @records = (@income_month.to_a + @spendings_month.to_a).sort_by(&:start_time).reverse
      @records.sort_by! { |r| [r.start_time.to_date, r.is_a?(Income) ? 0 : 1] }
    else
      @records = []
    end

    # 日の収入
    @spending_day = Spending.where(start_time: Time.now.beginning_of_day..Time.now.end_of_day).includes(:user).order(start_time: "ASC")
    # 日の収入合計
    @spending_day_sum = @spending_day.sum(:spending_price)
    # 日の支出
    @spending_day = Spending.where(start_time: Time.now.beginning_of_day..Time.now.end_of_day).includes(:user).order(start_time: "ASC")
    # 日の支出合計
    @spending_day_sum = @spending_day.sum(:spending_price)
    
    
  end
end
