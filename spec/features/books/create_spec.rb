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

	it "displays an error when the book has no title" do 
		expect(Book.count).to eq(0)


		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: ""
		fill_in "Author", with: "Test Author"
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: "0123456789"
		click_button "Create Book"

		expect(page).to have_content("error")
		expect(Book.count).to eq(0)

		visit "/books"
		expect(page).to_not have_content "Book was successfully created"
	end

	it "displays an error when the book has no author" do 
		expect(Book.count).to eq(0)


		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: "Test Title"
		fill_in "Author", with: ""
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: "0123456789"
		click_button "Create Book"

		expect(page).to have_content("error")
		expect(Book.count).to eq(0)

		visit "/books"
		expect(page).to_not have_content "Book was successfully created"
	end

	it "displays an error when the book has no serial number" do 
		expect(Book.count).to eq(0)


		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: "Test Title"
		fill_in "Author", with: "Test Author"
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: ""
		click_button "Create Book"

		expect(page).to have_content("error")
		expect(Book.count).to eq(0)

		visit "/books"
		expect(page).to_not have_content "Book was successfully created"
	end
	
	it "displays an error when the book has a title less than 3 characters" do 
		expect(Book.count).to eq(0)


		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: "ab"
		fill_in "Author", with: "Test Author"
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: "012345"
		click_button "Create Book"

		expect(page).to have_content("error")
		expect(Book.count).to eq(0)

		visit "/books"
		expect(page).to_not have_content "Book was successfully created"
	end

	it "displays an error when the book has an author less than 3 characters" do 
		expect(Book.count).to eq(0)


		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: "abc"
		fill_in "Author", with: "ab"
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: "012345"
		click_button "Create Book"

		expect(page).to have_content("error")
		expect(Book.count).to eq(0)

		visit "/books"
		expect(page).to_not have_content "Book was successfully created"
	end

	it "displays an error when the book has a serial number less than 6 characters" do 
		expect(Book.count).to eq(0)


		visit "/books"
		click_link "New Book"
		expect(page).to have_content("New Book")

		fill_in "Title", with: "Test Title"
		fill_in "Author", with: "Test Author"
		select "2010", from: "book[publication_date(1i)]"
		select "June", from: "book[publication_date(2i)]"
		select "15", from: "book[publication_date(3i)]"
		fill_in "Serial number", with: "01234"
		click_button "Create Book"

		expect(page).to have_content("error")
		expect(Book.count).to eq(0)

		visit "/books"
		expect(page).to_not have_content "Book was successfully created"
	end

end
