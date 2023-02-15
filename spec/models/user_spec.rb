require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confimation、名字（全角）と名前（全角）、名字カナ（全角）と名前カナ（全角）、電話番号（半角数字）があれば登録できる' do
        except(@user).to be_valid
      end
    end
  end
end
