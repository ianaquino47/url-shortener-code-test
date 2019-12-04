feature "URL shortener" do
	scenario "Can run app and check page content" do
		visit '/'
		expect(page).to have_content("Enter the URL that you want to shorten!")
	end

	scenario "A shortened link is given when original URL is submitted" do
		visit '/'
		fill_in('original_url', with: "http://www.farmdrop.com")
		click_button('shorten!')
        expect(page).to have_link("http://www.farmdrop.com")
        expect(page).to have_content("localhost:4567/")
    end

    scenario "Previous links show up on the list when a new URL is submitted" do
		visit '/'
		fill_in('original_url', with: "http://www.farmdrop.com")
        click_button('shorten!')
        fill_in('original_url', with: "http://www.facebook.com")
        click_button('shorten!')
        expect(page).to have_link("http://www.farmdrop.com")
        expect(page).to have_link("http://www.facebook.com")
    end


end 

