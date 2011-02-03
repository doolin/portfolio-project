

module ControllerMacros
  def login_admin
    before(:each) do
      sign_out :member
      sign_in Factory.create(:member)
    end
  end
end
