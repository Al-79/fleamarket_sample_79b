require 'rails_helper'

describe Address do
  describe '#create' do

    it "address_family_nameがない場合は登録できないこと" do
      user = build(:address, address_family_name: nil)
      user.valid?
      expect(user.errors[:address_family_name]).to include("を入力してください")
    end

    it "address_family_name_kanaがない場合は登録できないこと" do
      user = build(:address, address_family_name_kana: nil)
      user.valid?
      expect(user.errors[:address_family_name_kana]).to include("を入力してください")
    end

    it "address_first_nameがない場合は登録できないこと" do
      user = build(:address, address_first_name: nil)
      user.valid?
      expect(user.errors[:address_first_name]).to include("を入力してください")
    end

    it "address_first_name_kanaがない場合は登録できないこと" do
      user = build(:address, address_first_name_kana: nil)
      user.valid?
      expect(user.errors[:address_first_name_kana]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = build(:address, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "post_codeがない場合は登録できないこと" do
      user = build(:address, post_code: nil)
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:address, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "address_lineがない場合は登録できないこと" do
      user = build(:address, address_line: nil)
      user.valid?
      expect(user.errors[:address_line]).to include("を入力してください")
    end
  end
end