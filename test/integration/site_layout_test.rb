require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    # verify that the right page template is rendered

    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    # verify correct links to Home, Help, About, Contact pages

    get contact_path
    assert_select "title", full_title("Contact")

    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
