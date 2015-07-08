require 'spec_helper'

describe "creating a new book" do 
	it "redirects to the books index page on success" do
		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: "Test Title"
		fill_in "Author", with: "Test Author"
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: "0123456789"
		click_button "Create Book"

		expect(page).to have_content "Book was successfully created"
	end
end