require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        user = User.new(email: 'hello@test.io', password: '123456')
        expect(user.email).to_not be_nil
        expect(user.password_digest).to_not be_nil

      end

      it "validates that the password is at least 6 characters long" do
        user = User.new(email: 'hello@test.io', password: '12345')

      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post :create, params: { user: { email: 'hello@test.io', password: 'password'}}
        expect(response).to redirect_to(bands_url)
      end
    end
  end
end
