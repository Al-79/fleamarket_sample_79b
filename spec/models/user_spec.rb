require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "nil") # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入
      user.valid? #バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
      expect(user.errors[:nickname]).to include() 
    end

    it "nicknameが20文字以上であると登録できないこと" do
      user = build(:user, nickname: "12345678910000000000021")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end
 
    it "nicknameが20文字以下であれば登録できること" do
      user = build(:user, nickname: "taro")
      user.valid?
      expect(user).to be_valid
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("", "は無効です。再入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("", "は7文字以上で入力してください", "は無効です。再入力してください")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "yamadadesu11", password_confirmation: "yamadadesu11")
      user.valid?
      expect(user).to be_valid
    end
 
    it "passwordが7文字以下である場合は登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください", "は無効です。再入力してください")
    end
  
    it "password_confirmationとpasswordが異なる場合保存できない" do 
      expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
    end 

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birth_dateがない場合は登録できないこと" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end

    # 名前全角入力のテスト ▼

    it 'family_nameが全角入力でなければ登録できないこと' do
      user = build(:user, family_name: "ｱｲｳｴｵ") # 意図的に半角入力を行いエラーを発生させる
      user.valid?
      expect(user.errors[:family_name]).to include("は無効です。再入力してください")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      user = build(:user, first_name: "ｱｲｳｴｵ") # 意図的に半角入力を行いエラーを発生させる
      user.valid?
      expect(user.errors[:first_name]).to include("は無効です。再入力してください")
    end

    # カタカナ全角入力のテスト ▼

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, family_name_kana: "あいうえお") # 意図的にひらがな入力を行いエラーを発生させる
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は無効です。再入力してください")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, first_name_kana: "あいうえお") # 意図的にひらがな入力を行いエラーを発生させる
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は無効です。再入力してください")
    end
  end
end