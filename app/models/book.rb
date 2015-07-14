class Book < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :title, length: {minimum: 3}
	validates :author, presence: true
	validates :author, length: {minimum: 3}
	validates :serial_number, presence: true
	validates :serial_number, length: {minimum: 6}
	#validates :publication_date, presence: true
	# validates_date :publication_date, presence: true
	validates :publication_date, timeliness: { allow_nil: false, allow_blank: false }
end
