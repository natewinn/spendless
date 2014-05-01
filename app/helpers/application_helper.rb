module ApplicationHelper

	def full_title(page_title)
		base_title = "Spendless"
		page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
	end

  def money(num)
    number_to_currency(num)
  end

  def budget_countdown(budget)
    distance_of_time_in_words(Time.now, budget.end_date)
  end

  def phone(phone_number)
    number_to_phone(phone_number, area_code: true)  
  end

  def format_date(date)

    if !date.nil?
      date.strftime("%B %d, %Y")
    else
      "No record"
    end
  end

end
