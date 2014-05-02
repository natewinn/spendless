class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :user

  scope :incoming_money, -> {where(transaction_type: "income")}
  scope :outgoing_money, -> {where(transaction_type: "expense")}
  # scope :by_name, ->(name) { where('name = ?', name) }

  def self.by_start_dates(begin_date)
		where('transaction_date >= ?', begin_date)
	end

	def self.by_end_dates(end_date)
		where('transaction_date <= ?', end_date)
	end

	def self.by_dates(begin_date, end_date)
		where('transaction_date BETWEEN ? AND ?', begin_date, end_date)
	end

	def self.by_name(name)
		where('name LIKE ?', name)
	end

	def self.by_category(cat)
		where('category LIKE ?', cat)
	end

	# def self.by_amount(amount)
	# 	where('amount LIKE ?', amount)
	# end

	def self.by_start_amounts(begin_amount)
		where('amount >= ?', begin_amount)
	end

	def self.by_end_amounts(end_amount)
		where('amount <= ?', end_amount)
	end

	def self.by_amounts(begin_amount, end_amount)
		where('transaction_amount BETWEEN ? AND ?', begin_amount, end_amount)
	end

	def self.by_user_name(user_id)
		where('user_id = ?', user_id)
	end


	# def self.by_keyword(keyword)
	# 	where('category LIKE ?', keyword)
	# end


  def self.search(params)
  	cat = params[:cat]
  	name = params[:name]
  	begin_date = params[:begin_date]
  	end_date = params[:end_date]
  	amount = params[:amount]
  	begin_amount = params[:begin_amount]
  	end_amount = params[:end_amount]
  	user_id = params[:user_id]
  	# string_keyword = params[:string_keyword]

  	search = self.all

  	if params[:trans_type] == "Income"
  		search = search.incoming_money
  	elsif params[:trans_type] == "Expenses"
  		search = search.outgoing_money
  	end

  	if cat.present?
  		search = search.by_category(cat)
  	end

  	if name.present?
  		search = search.by_name(name)
  	end

  	if user_id.present?
  		search = search.by_user_name(user_id)
  	end

  	# if keyword.present?
  	# 	search = search.by_keyword(keyword)
  	# end

  	if (begin_date && end_date).present?
			search = search.by_dates(begin_date, end_date)
		elsif begin_date.present?
			search = search.by_start_dates(begin_date)
		elsif end_date.present?
			search = search.by_end_dates(end_date)
		end

		# if amount.present?
		# 	search = search.by_amount(amount)
		# end

		if (begin_amount && end_amount).present?
			search = search.by_amounts(begin_amount, end_amount)
		elsif begin_amount.present?
			search = search.by_start_amounts(begin_amount)
		elsif end_amount.present?
			search = search.by_end_amounts(end_amount)
		end

		search

	end


end