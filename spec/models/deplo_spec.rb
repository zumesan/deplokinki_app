require 'rails_helper'

RSpec.describe Deplo, type: :model do
  before do
    @deplo = FactoryBot.build(:deplo)
  end

  describe 'deplo投稿' do
    context 'deplo投稿ができる場合' do
      it 'deplo_titleとdeplo_infoとmunicipalityとcategory_idとprefecture_idが存在していれば投稿できる' do
        expect(@deplo).to be_valid
      end
      it 'imageが空でも投稿できる' do
        @deplo.images = nil
        expect(@deplo).to be_valid
      end
    end
    context 'deploが投稿できない場合'do
      it 'ユーザー情報がない場合は登録できない' do
        @deplo.user = nil
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("Userを入力してください")
      end
      it 'deplo_titleが空のときは投稿できない' do
        @deplo.deplo_title = ''
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("タイトルを入力してください", "タイトルは1文字以上で入力してください")
      end
      it 'deplo_titleが40字を超えている場合は投稿できない' do
        @deplo.deplo_title = '12345678901234567890123456789012345678901'
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("タイトルは40文字以内で入力してください")
      end
      it 'deplo_infoが空のときは投稿できない' do
        @deplo.deplo_info = ''
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("内容を入力してください", '内容は1文字以上で入力してください')
      end
      it 'deplo_infoが140字を超えている場合は投稿できない' do
        @deplo.deplo_info = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("内容は140文字以内で入力してください")
      end
      it 'municipalityが空のときは投稿できない' do
        @deplo.municipality = ''
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'category_idが選択されていないと投稿できない' do
        @deplo.category_id = '0'
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'prefecture_idが選択されていないと投稿できない' do
        @deplo.prefecture_id = '0'
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("都道府県を選択してください")
      end
      it '画像が6枚以上では投稿できない' do
        @deplo.images = nil
        @deplo.images = [ fixture_file_upload('map.png','image/png'), fixture_file_upload('deplo_logo.png','image/png'), fixture_file_upload('no_image.001.png','image/png'), fixture_file_upload('sample1.png','image/png'), fixture_file_upload('test_image2.png','image/png'), fixture_file_upload('output-image2.png','image/png') ]
        @deplo.valid?
        expect(@deplo.errors.full_messages).to include("画像は5枚以内で投稿してください")
      end
    end
  end
end
