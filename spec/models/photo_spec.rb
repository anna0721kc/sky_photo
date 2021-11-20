 # frozen_string_literal: true
require 'rails_helper'
RSpec.describe Photo, type: :model do
    it "photoモデルのテスト" do
    expect(FactoryBot.build(:photo)).to be_valid
    end
end