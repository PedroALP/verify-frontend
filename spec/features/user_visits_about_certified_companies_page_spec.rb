require 'feature_helper'
require 'api_test_helper'
require 'cookie_names'

RSpec.describe 'When the user visits the about certified companies page' do
  let(:simple_id) { 'stub-idp-one' }
  let(:idp_entity_id) { 'http://idcorp.com' }

  before(:each) do
    stub_transactions_list
    stub_api_idp_list
    set_session_and_session_cookies!
  end

  it 'includes the appropriate feedback source' do
    visit '/about-certified-companies'

    expect_feedback_source_to_be(page, 'ABOUT_CERTIFIED_COMPANIES_PAGE', '/about-certified-companies')
  end

  it 'displays content in Welsh' do
    visit '/am-gwmniau-ardystiedig'

    expect(page).to have_content 'Sut y gall cwmnïau wirio hunaniaeth'
    expect(page).to have_content 'Gall y cwmnïau hyn ddefnyddio eu data eu hunain'
  end

  it 'displays IdPs that are enabled' do
    visit '/about-certified-companies'

    expect(page).to have_css("img[src*='/white/#{simple_id}']")
  end

  it 'will show "How companies can verify identities" section' do
    visit '/about-certified-companies'

    expect(page).to have_content 'How companies can verify identities'
    expect(page).to have_content 'These companies can use their own data'
  end

  it 'will go to about identity accounts page when next is clicked' do
    visit '/about-certified-companies'
    click_link('Next')

    expect(page).to have_current_path('/about-identity-accounts')
  end
end
