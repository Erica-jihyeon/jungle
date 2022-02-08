require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
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

  scenario "They see the selected product" do
    # ACT
    visit root_path
    find_link("Details").trigger("click")

    # # VERIFY
    expect(page).to have_css 'section.products-show'
    save_screenshot
    # puts page.html
  end


end
