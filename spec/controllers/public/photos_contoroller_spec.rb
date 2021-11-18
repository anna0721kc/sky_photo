require 'rails_helper'
RSpec.describe Public::PhotosController, type: :controller do
  before do
      @customer = FactoryBot.create(:customer)
    end
  describe "#index" do
    context '写真投稿一覧のテスト' do
    # 正常なレスポンスか？
      it "indexページへアクセスできるか？" do
        get :index
        expect(response).to be_success
      end
    # 200番台のレスポンスが返ってきているか？
      it " 200番台が返ってくるか？" do
        get :index
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#new" do
    context '写真投稿ページのテスト' do
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
      it "ログイン前だとnewページへのアクセスをはじくか" do
        get :new
        expect(response).to_not be_success # 正常にレスポンスが返ってきていないか？
      end
    end
  end

  describe "#create" do
    let(:image_path) { File.join(Rails.root, '/spec/photos/img/image14.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    context "投稿のテスト" do
      # before do
      #   binding.pry
      # @photo = FactoryBot.create(:photo)
      # end
      it "保存できるか？" do
        sign_in @customer
        expect {
          post :create, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              # image_id: Rack::Test::UploadedFile.new("#{Rails.root}/spec/photos/img/image14.jpg", "image/jpeg"),
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }.to change(@customer.photos, :count).by(1)
      end
    end
  end
end