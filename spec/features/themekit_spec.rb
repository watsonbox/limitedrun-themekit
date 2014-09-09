require 'spec_helper'

feature 'Limited Run theme kit site preview' do
  it 'renders the home page' do
    visit '/'

    expect(page).to have_content 'This is limitedrun-themekit'
  end
end
