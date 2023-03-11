require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @users = FactoryBot.create(:user)
  end

  def deplo_toukou
    # ログインする
    sign_in(@user)

    # 新規投稿画面に遷移
    click_on '新規投稿'

    # 画像を選択
    image_path = Rails.root.join('spec/fixtures/test_image2.png')
    attach_file('deplo_images', image_path, make_visible: true)

    # タイトルを入力
    title = 'テスト'
    fill_in 'deplo-title', with: title
    
    # 内容を入力
    info = 'テスト記述'
    fill_in 'deplo-info', with: info

    # カテゴリーを選択
    select 'グルメ', from: 'deplo-category'

    # 都道府県を選択
    select '三重県', from: 'deplo-prefecture'

    # 市区町村を入力
    municipality = 'いるなべ市'
    fill_in 'municipality', with: municipality

    click_on '投稿する'
  end

  def comment_post
    click_on '三重県'
    click_on 'テスト'
    contents = 'テストコメント'
    fill_in 'comment_comment_content', with: contents
    click_on 'コメント送信'
    expect(page).to have_content('テストコメント')
  end

  context 'コメントができるとき' do
    it 'ログインしているとコメントできる' do
      deplo_toukou
      click_on 'ログアウト'
      sign_in(@users)
      comment_post
    end

    it '自分で投稿したdeploにもコメントできる' do
      deplo_toukou
      comment_post
    end
  end

  context 'コメントができないとき' do
    it 'ログインしていないとコメント投稿フォームが表示されない' do
      deplo_toukou
      click_on 'ログアウト'
      click_on '三重県'
      click_on 'テスト'
      expect(page).to_not have_content('comment_comment_content')
    end
  end
end
