require 'spec_helper'

feature 'Limited Run theme kit site preview' do
  it 'renders a CSS file' do
    visit '/stylesheets/default.css'

    expect(page.status_code).to eq(200)
    expect(page).to have_content "#container #main #content .roster-item #product-grid, #container #main #content .roster-item #history"
  end

  it 'renders the home page with correct title' do
    visit '/'
    expect(page).to have_title 'Pinna Records'
  end

  it 'renders products on the home page' do
    visit '/'

    expect(page).to have_css('#product-grid .product', count: 1)
    expect(page).to have_selector('#product-grid .product .info', :text => "Eliane Lust - Entangoed")
  end
end
