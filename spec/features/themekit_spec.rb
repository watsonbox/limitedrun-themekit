require 'spec_helper'

feature 'Limited Run theme kit site preview' do
  it 'renders the home page' do
    visit '/'

    expect(page.status_code).to eq(200)
  end
end
