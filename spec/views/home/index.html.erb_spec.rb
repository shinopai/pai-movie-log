require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it "contains root link" do
    visit root_path
    expect(page).to have_link nil, href: root_path
  end

  it "contains login link" do
    visit root_path
    expect(page).to have_link 'LOGIN', href: new_user_session_path
  end
end
