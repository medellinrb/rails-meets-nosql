module ControllerMacros
  def login_company
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:company]
      company = FactoryGirl.create(:company)
      sign_in company
    end
  end

  def login_developer
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:developer]
      developer = FactoryGirl.create(:developer)
      sign_in developer
    end
  end
end
