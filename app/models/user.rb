class User < ActiveRecord::Base

  has_many :checkouts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable and :omniauthable

  def check_out!(book)
  	return false if !book || !book.available?
  	
  	self.checkouts.create(:book_id => book.id, :checked_out_at => DateTime.now)
  end

  def check_out_for(book)
  	return false if !book || !book.available?
  	self.checkouts.find_by_book_id(book.id)
  end

  def check_in!(book)
  	return false if book.checked_out_by != self
  	checkout = self.find_checkout_for_book(book)
  	checkout.returned_at = DateTime.now
  	checkout.save
  end

  def find_checkout_for_book(book)
  	self.checkouts.where(:book_id => book.id, :returned_at => nil).last
  end

end
