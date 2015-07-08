class Book < ActiveRecord::Base
	validates :title, presence: true
	validates :author, presence: true
	validates :serial_number, presence: true
	#validates :publication_date, presence: true
	# validates_date :publication_date, presence: true
	validates :publication_date, timeliness: { allow_nil: false, allow_blank: false }
end
