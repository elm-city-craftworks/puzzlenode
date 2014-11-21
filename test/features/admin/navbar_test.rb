require_relative '../../test_helper'

feature "Admin Navbar" do
  setup do
    @admin_user = FactoryGirl.create(:user, :admin => true)
    @admin_user.authorizations.create(:provider => "github", :uid => "12345")
  end

  test "Only admins can see admin navbar" do
    visit root_path

    assert_no_content "Administration"

    sign_user_in

    assert_content "Administration"
  end
end
