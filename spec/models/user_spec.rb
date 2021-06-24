require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do

      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password 
        @user.password_confirmation
        expect(@user).to be_valid
      end

      it '趣味が入力されていなくても保存できること' do
        @user.hobby = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_name_detailsが空では登録できない' do
        @user.last_name_details = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナを入力してください")
      end
      it 'first_name_detailsが空では登録できない' do
        @user.first_name_details = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のフリガナを入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it 'last_nameが全角漢字、ひらがな、カタカナでないと保存できないこと' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字が無効です。全幅文字で入力してください")
      end
      it 'first_nameが全角漢字、ひらがな、カタカナでないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が無効です。全幅文字で入力してください")
      end
      it 'last_nameが、カタカナでないと保存できないこと' do
        @user.last_name_details = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナが無効です。全幅カタカナ文字で入力してください")
      end
      it 'first_nameが、カタカナでないと保存できないこと' do
        @user.first_name_details = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字のフリガナが無効です。全幅カタカナ文字で入力してください")
      end
      
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@がなければ保存できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000f'
        @user.password_confirmation = '000f'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは英語のみでは登録できない' do
        @user.password = 'tttttt'
        @user.password_confirmation = 'tttttt'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めて設定してください")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '666666'
        @user.password_confirmation = '666666'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めて設定してください")
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'TTTTTT'
        @user.password_confirmation = 'TTTTTT'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めて設定してください")
      end
    end
  end
end