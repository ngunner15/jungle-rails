require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    click_on 'Signup'
    fill_in 'user[name]', with: 'name'
    fill_in 'user[email]', with: 'test1@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Submit'

    expect(page).to have_content('My Cart (0)')
  
    # VERIFY
    click_button('Add')
  
    expect(page).to have_content('My Cart (1)')
  
    # DEBUG
    save_screenshot 'add_to_cart_test1.png'

  end
end
