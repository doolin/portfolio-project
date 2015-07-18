# macros for controllers
# more comment - this is a rubocop thing. I don't
# think I like it.
module ControllerMacros
  def login_admin
    before(:each) do
      sign_out :member
      sign_in Factory.create(:member)
    end
  end
end
