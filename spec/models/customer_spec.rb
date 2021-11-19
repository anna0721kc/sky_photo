 # frozen_string_literal: true
require 'rails_helper'
RSpec.describe Customer, type: :model do
    it "customerモデルのテスト" do
    expect(FactoryBot.build(:customer)).to be_valid
    end
end