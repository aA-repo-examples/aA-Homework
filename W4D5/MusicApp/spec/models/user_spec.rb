require 'rails_helper'

describe User do

  # validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates a password digest when a password is given" do
    user = User.new(email:'hello', password:'password')
    expect(user.password_digest).to_not be_nil
  end

  it "creates session token before validation" do
    user = User.new(email:'hello', password:'password')
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      user = User.new(email:'hello', password:'good_password')
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies a password is not correct" do
      user = User.new(email:'hello', password:'good_password')
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user = User.new(email:'hello', password:'good_password')
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      user = User.new(email:'hello', password:'good_password')
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    user = User.new(email:'jonathan@fakesite.com', password:'good_password')
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      # user = User.new(email:'jonathan@fakesite.com', password:'good_password')
      expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
    end
  end

end
