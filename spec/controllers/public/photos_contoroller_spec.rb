require 'rails_helper'
RSpec.describe Public::PhotosController, type: :controller do
  before do
      @customer = FactoryBot.create(:customer)
    end
  describe "#index" do
    # 正常なレスポンスか？
    it "アクセスできるか？" do
      get :index
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it " 200番台が返ってくるか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
  describe "#new" do
    it "正常にアクセスできるか" do
      sign_in @customer
      get :new
      expect(response).to be_success
    end
    it "200番台が返ってくるか" do
      sign_in @customer
      get :new
      expect(response).to have_http_status "200"
    end
    it "アクセスをはじくか" do

      get :new
      expect(response).to_not be_success#
    end
  end
end