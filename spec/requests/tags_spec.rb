require 'rails_helper'

RSpec.describe "Tags", type: :request do
  context 'ログイン状態' do
    before do
      user = User.create(
        user_name: "ログインユーザー",
        password: "user000",
        password_confirmation: "user000"
      )
    end

    describe "GET /tags" do
      it "HTTPレスポンスが200になる" do
        get tags_path
        expect(response).to have_http_status(200)
      end
    end
  end
end

