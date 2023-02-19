require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confimation、名字（全角）と名前（全角）、名字カナ（全角）と名前カナ（全角）、電話番号（半角数字）があれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空のときは登録できない' do
        @user.nickname = ''
        @user.valid?
        @user.errors.full_messages
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空のときは登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'emailに@が入っていないときは登録できない' do
        @user.email = 'aaa.icloud.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'emailにドメイン名が入っていないときは登録できない' do
        @user.email = 'aaa@'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it '重複したemailがある場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'passwordが空のときは登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください","パスワード（確認）とパスワードの入力が一致しません")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it 'passwordに全角文字が含まれていると登録できない' do
        @user.password = 'aaa０００'
        @user.password_confirmation = 'aaa０００'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
      end
      it 'last_nameが空のときは登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は全角で入力してください", "苗字は1文字以上で入力してください")
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力してください")
      end
      it 'last_nameに半角数字が含まれていると登録できない' do
        @user.last_name = '田中1'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力してください")
      end
      it 'last_nameに全角数字が含まれていると登録できない' do
        @user.last_name = '田中１'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力してください")
      end
      it 'first_nameが空のときは登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は全角で入力してください", "名前は1文字以上で入力してください")
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name = 'naoki'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください")
      end
      it 'first_nameに半角数字が含まれていると登録できない' do
        @user.first_name = '直樹1'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください")
      end
      it 'first_nameに全角数字が含まれていると登録できない' do
        @user.first_name = '直樹１'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください")
      end
      it 'last_name_kanaが空のときは登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください", "苗字（カナ）は全角カタカナで入力してください", "苗字（カナ）は1文字以上で入力してください")
      end
      it 'last_name_kanaに半角文字が含まれていると登録できない' do
        @user.last_name_kana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は全角カタカナで入力してください")
      end
      it 'last_name_kanaに半角数字が含まれていると登録できない' do
        @user.last_name_kana = 'タナカ1'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は全角カタカナで入力してください")
      end
      it 'last_name_kanaに全角数字が含まれていると登録できない' do
        @user.last_name_kana = 'タナカ１'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は全角カタカナで入力してください")
      end
      it 'first_name_kanaが空のときは登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）は全角カタカナで入力してください", "名前（カナ）は1文字以上で入力してください")
      end
      it 'first_name_kanaに半角文字が含まれていると登録できない' do
        @user.first_name_kana = 'naoki'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は全角カタカナで入力してください")
      end
      it 'first_name_kanaに半角数字が含まれていると登録できない' do
        @user.first_name_kana = 'naoki1'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は全角カタカナで入力してください")
      end
      it 'first_name_kanaに全角数字が含まれていると登録できない' do
        @user.first_name_kana = 'naoki１'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は全角カタカナで入力してください")
      end
      it 'phone_numberが空のときは登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it 'phone_numberに半角英字が含まれているときは登録できない' do
        @user.phone_number = '0901234567a'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it 'phone_numberに全角文字が含まれている場合は登録できない' do
        @user.phone_number = '0901234567あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it 'phone_numberが全角数字の場合は登録できない' do
        @user.phone_number = '０９０１２３４５６７８'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
    end
  end
end
