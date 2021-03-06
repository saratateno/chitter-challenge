feature 'creates peeps' do
  before(:all) do
    sign_up
  end

  before(:each) do
    sign_in
  end

  scenario 'user posts a peep to Chitter' do
    expect{ post_peep("Hello world") }.to change{ User.first.peeps.count }.by 1
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Hello world'
  end

  scenario 'cannot peep if not signed in' do
    click_button 'Sign out'
    page.assert_no_selector("input[type=submit][value='Peep']")
  end
end
