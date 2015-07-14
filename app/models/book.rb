class Book < ActiveRecord::Base

	has_many :checkouts

	validates :title, presence: true
	validates :title, length: {minimum: 3}
	validates :author, presence: true
	validates :author, length: {minimum: 3}
	validates :serial_number, presence: true
	validates :serial_number, length: {minimum: 6}
	#validates :publication_date, presence: true
	# validates_date :publication_date, presence: true
	validates :publication_date, timeliness: { allow_nil: false, allow_blank: false }

	def last_checkout
		self.checkouts.last
	end

	def available?
		return true if !last_checkout 
		last_checkout.returned_at!=nil
	end

	def checked_out_by
		return if available?

		last_checkout.user
	end

end
