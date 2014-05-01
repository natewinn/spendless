module ApplicationHelper

  def money(num)
    number_to_currency(num)
  end

  def budget_countdown(budget)
    distance_of_time_in_words(Time.now, budget.end_date)
  end

end
