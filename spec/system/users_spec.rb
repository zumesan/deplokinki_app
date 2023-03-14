require 'rails_helper'


RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインに成功し、トップページに遷移し、正常にログアウトする' do
    # サインインページへ遷移
    visit new_user_session_path

    # サインインページに遷移していることを確認
    expect(current_path).to eq(new_user_session_path)

    #すでに保存されているユーザーのemailとpasswordを入力
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリック
    find('#hoge').click

    #トップページに遷移
    expect(current_path).to eq(root_path)

    click_on 'ログアウト'

    # 特定の文字列があるか検証
    expect(page).to have_content('ゲストさんこんにちは！')
  end

  it 'ログインに失敗し、再びサインインページに遷移する' do
    visit new_user_session_path

    expect(current_path).to eq(new_user_session_path)

    # 誤ったユーザー情報を入力
    fill_in 'user_email', with: 'test'
    fill_in 'user_password', with: 'test'

    find('#hoge').click

    # サインインページに戻っていることを確認
    expect(current_path).to eq(new_user_session_path)
  end
end
