require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: "nil")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "categoryがない場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end
    
    it "sizeがない場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "introductionがない場合は登録できないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    it ":preparation_dayがない場合は登録できないこと" do
      item = build(:item, preparation_day: nil)
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "postage_payerがない場合は登録できないこと" do
      item = build(:item, cpostage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end
    
    it "全て揃っている時保存できる" do
      item = build(:item)
      expect(item).to be_valid
    end

  end
end