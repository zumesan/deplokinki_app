require 'rails_helper'

RSpec.describe "Deplos", type: :system do
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

  def deplo_hensyu
    image_path = Rails.root.join('spec/fixtures/sample1.png')
    attach_file('deplo_images', image_path, make_visible: true)
    title = '編集テスト'
    fill_in 'deplo-title', with: title
    info = '編集のテスト'
    fill_in 'deplo-info', with: info
    select 'エンタメ', from: 'deplo-category'
    select '大阪府', from: 'deplo-prefecture'
    municipality = '大阪市'
    fill_in 'municipality', with: municipality
  end

  context '投稿ができるとき' do
    it 'deploの投稿に成功すると、トップページに遷移する' do
      deplo_toukou

      expect(current_path).to eq(root_path)
    end

    it '投稿内容の詳細を確認できる' do
      deplo_toukou

      click_on '三重県'

      # 添付した画像、テキストが画面上にあるか確認
      expect(page).to have_selector("img[src$='test_image2.png']")
      expect(page).to have_content('テスト')

      click_on 'テスト'

      # 詳細表示画面に以下の表示があるか確認
      expect(page).to have_selector("img[src$='test_image2.png']")
      expect(page).to have_content('テスト')
      expect(page).to have_content('テスト記述')
      expect(page).to have_content('グルメ')
      expect(page).to have_content('三重県')
      expect(page).to have_content('いるなべ市')
      expect(page).to have_content(@user.nickname)
    end

    it 'deploの編集後、deplo詳細画面に遷移する' do
      deplo_toukou

      click_on '三重県'

      expect(page).to have_selector("img[src$='test_image2.png']")
      expect(page).to have_content('テスト')

      click_on 'テスト'
      click_on '編集する'

      deplo_hensyu

      click_on '変更する'

      expect(page).to have_selector("img[src$='sample1.png']")
      expect(page).to have_content('編集テスト')
      expect(page).to have_content('編集のテスト')
      expect(page).to have_content('エンタメ')
      expect(page).to have_content('大阪府')
      expect(page).to have_content('大阪市')
      expect(page).to have_content(@user.nickname)
    end

    it '投稿したdeploが削除されたとき、トップページに遷移する' do
      deplo_toukou

      click_on '三重県'
      click_on 'テスト'
      click_on '削除'

      expect(current_path).to eq(root_path)
    end

    it '自分で投稿したdeploがある場合、プロフィール画面に一覧表示される' do
      deplo_toukou
      visit deplos_prefecture_users_show_path
      expect(page).to have_content('テスト')
    end

    it 'deplo詳細画面で投稿者のnicknameをクリックすると、投稿者の詳細ページに遷移する' do
      deplo_toukou
      click_on 'ログアウト'
      sign_in(@users)
      click_on '三重県'
      click_on 'テスト'
      click_on (@user.nickname)
      expect(page).to have_content(@user.nickname)
    end
  end

  context '投稿ができないとき' do
    it 'ログインしていないときは投稿ボタンが表示されない' do
      # ページ内に指定した文字列がないことの確認
      expect(page).not_to have_content('新規投稿')
    end

    it 'ログインしていないときは投稿画面に遷移できない' do
      visit new_deplo_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'deploの保存に失敗したときは、投稿画面に戻る' do
      sign_in(@user)
      click_on '新規投稿'
      expect(current_path).to eq(new_deplo_path)
      deplo_hensyu

      title = ''
      fill_in 'deplo-title', with: title

      click_on '投稿する'
      expect(current_path).to eq(deplos_path)
      expect(page).to have_content('タイトルを入力してください')
      expect(page).to have_content('タイトルは1文字以上で入力してください')
    end
  end

  context '編集ができないとき' do
    it 'ログインしていなければ編集ボタンは表示されない' do
      deplo_toukou
      click_on 'ログアウト'
      click_on '三重県'
      click_on 'テスト'
      expect(page).not_to have_content('編集する')
    end

    it '投稿したユーザー以外には、編集ボタンは表示されない' do
      deplo_toukou
      click_on 'ログアウト'
      sign_in(@users)
      click_on '三重県'
      click_on 'テスト'
      expect(page).not_to have_content('編集する')
    end
  end

  context '削除ができないとき' do
    it 'ログインしていなければ、削除ボタンは表示されない' do
      deplo_toukou
      click_on 'ログアウト'
      click_on '三重県'
      click_on 'テスト'
      expect(page).not_to have_content('削除する')
    end

    it '投稿したユーザー以外には、削除ボタンは表示されない' do
      deplo_toukou
      click_on 'ログアウト'
      sign_in(@users)
      click_on '三重県'
      click_on 'テスト'
      expect(page).not_to have_content('削除する')
    end
  end

  context '検索できるとき' do
    it '検索フォームに入力せずに検索すると、投稿されている全てのdeploが一覧表示される' do
      deplo_toukou
      click_on '新規投稿'
      deplo_hensyu
      click_on '投稿する'
      click_on '検索'
      expect(page).to have_content('テスト')
      expect(page).to have_content('編集テスト')
    end

    it '検索フォームに検索ワードを入れて検索すると、対象のdeploが表示される' do
      deplo_toukou
      searchcontent = 'テスト'
      fill_in 'q_deplo_title_or_deplo_info_or_municipality_cont', with: searchcontent
      click_on '検索'
      expect(page).to have_content('テスト')
    end

    it '都道府県を選択して検索すると、対象のdeploが表示される' do
      deplo_toukou
      select '三重県', from: 'q_prefecture_id_eq'
      click_on '検索'
      expect(page).to have_content('テスト')
    end

    it 'カテゴリーを選択して検索すると、対象のdeploが表示される' do
      deplo_toukou
      select 'グルメ', from: 'q_category_id_eq'
      click_on '検索'
      expect(page).to have_content('テスト')
    end
  end
end