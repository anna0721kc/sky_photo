require 'rails_helper'
RSpec.describe Public::PhotosController, type: :controller do
  before do
      @customer = FactoryBot.create(:customer)
      # bybug
  end

  describe "#index" do
    context '写真投稿一覧のテスト' do
    # 正常なレスポンスか？
      it "indexページへアクセスできるか？" do
        get :index
        expect(response).to be_successful
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
      expect(response).to be_successful
    end
      it "200番台が返ってくるか" do
        sign_in @customer
        get :new
        expect(response).to have_http_status "200"
      end
      it "ログイン前だとnewページへのアクセスをはじくか" do
        get :new
        expect(response).to_not be_successful # 正常にレスポンスが返ってきていないか？
      end
    end
  end

  describe "#create" do
    let(:image_path) { File.join(Rails.root, '/spec/photos/img/image14.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    context "投稿のテスト" do
      it "保存できるか？" do
        sign_in @customer
        expect {
          post :create, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image, # 43行目のlet(:image)
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }.to change(@customer.photos, :count).by(1)
      end
    end
  end

  describe "#show" do
    let(:image_path) { File.join(Rails.root, '/spec/photos/img/image14.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    context '写真詳細のテスト' do
      it "showページへアクセスできるか？" do
        # get :show, params: {id: @photo.id}
        # expect(response).to be_success
        expect {
          get :show, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }
      end
    # 200番台のレスポンスが返ってきているか？
      it " 200番台が返ってくるか？" do
        expect {
          get :show, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }
        expect(response).to have_http_status "200"
      end
    end
  end


  describe "#edit" do
    let(:image_path) { File.join(Rails.root, '/spec/photos/img/image14.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    context '写真編集のテスト' do
      it "editページへアクセスできるか？" do
        # get :show, params: {id: @photo.id}
        # expect(response).to be_success
        expect {
          get :edit, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }
      end
    # 200番台のレスポンスが返ってきているか？
      it " 200番台が返ってくるか？" do
        expect {
          get :edit, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#update" do
    let(:image_path) { File.join(Rails.root, '/spec/photos/img/image14.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    context '写真編集処理のテスト' do
      it "updateできるか？" do
        # get :show, params: {id: @photo.id}
        # expect(response).to be_success
        expect {
          get :update, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }
      end
    # 200番台のレスポンスが返ってきているか？
      it " 200番台が返ってくるか？" do
        expect {
          get :update, params: {
            photo: {
              latitude: "35.6895014",
              longitude: "139.6917337",
              customer_id: @customer.id,
              image: image,
              address: "東京都新宿区西新宿2-8-1"
            }
          }
        }
        expect(response).to have_http_status "200"
      end
    end
  end
end