class AccountsController < ApplicationController

	def account
		@books = current_user.checked_out_books
	end






end
