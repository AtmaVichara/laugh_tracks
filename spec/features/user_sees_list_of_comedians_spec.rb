describe "a user can see the comedians" do
  context "when user navigates to /comedians" do
    it "user can see all comedians and attributes" do
      Comedian.create(name: 'Joe Rogan', age: 50)
      Comedian.create(name: 'Bill Burr', age: 49)

      visit '/comedians'

      expect(page).to have_content("Joe Rogan")
      expect(page).to have_content("Bill Burr")
      expect(page).to have_content("50")
      expect(page).to have_content("49")
    end

    it "user can see all comedians specials" do
      Comedian.create(name: 'Bill Burr', age: 49)
      Special.create(name: 'Walk Your Way Out', comedian_id: 1)
      Special.create(name: 'You People Are All The Same', comedian_id: 1)
      Special.create(name: 'Let It Go', comedian_id: 1)

      visit '/comedians'

      expect(page).to have_content("Walk Your Way Out")
      expect(page).to have_content('You People Are All The Same')
      expect(page).to have_content('Let It Go')
    end

    it "user can see the average age of all comedians on the page" do
      Comedian.create(name: 'Joe Rogan', age: 50)
      Comedian.create(name: 'Bill Burr', age: 49)
      Comedian.create(name: 'Duncan Trussell', age: 43)

      visit '/comedians'

      expect(page).to have_content("Average Comdians Age: 47")
    end
  end
end
