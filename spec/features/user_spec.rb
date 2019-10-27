require 'rails_helper'

RSpec.feature 'ユーザー管理機能', type: :feature do
  background do
    user_a = FactoryBot.create(:user, name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test', admin: true)
    user_b = FactoryBot.create(:user, name: 'mof', email: 'mof@mof.com', password: 'mof', password_confirmation: 'mof', admin: false)
    FactoryBot.create(:task, title: 'test', description: 'testtesttest', limited_at: Time.now, status: 0, priority: 0, user: user_a)
    FactoryBot.create(:task, title: 'mof', description: 'mofmofmofmof', limited_at: Time.now, status: 1, priority: 1, user: user_b)
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
    click_link 'ユーザー一覧'
  end

  scenario 'ログインの成功テスト', skip: true do
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
    save_and_open_page
    expect(page).to have_content 'タスク一覧'
  end

  scenario 'ログインの失敗テスト', skip: true do
    visit root_path
    click_button 'ログインする'
    save_and_open_page
    expect(page).to have_content 'ログイン'
  end

  scenario 'タスクの表示テスト', skip: true do
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
    save_and_open_page
    expect(page).to have_content 'test'
    expect(page).not_to have_content 'mof'
  end

  scenario 'ログアウトの表示テスト', skip: true do
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
    click_link 'ログアウト'
    save_and_open_page
    expect(page).to have_content 'ログイン'
  end

  scenario 'ユーザーの登録と表示テスト', skip: true do
    visit new_user_path
    fill_in '名前', with: 'man'
    fill_in 'メールアドレス', with: 'man@man.com'
    fill_in 'パスワード', with: 'man'
    fill_in 'パスワード(確認)', with: 'man'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content 'ユーザの詳細'
  end

  scenario 'ログインしている時はユーザー登録画面に行かせないテスト', skip: true do
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
    visit new_user_path
    save_and_open_page
    expect(page).to have_content 'タスク一覧'
  end

  scenario '自分以外のユーザのマイページに行かせないテスト', skip: true do
    visit user_path(2)
    save_and_open_page
    expect(page).to have_content 'タスク一覧'
  end

  scenario '管理画面のユーザー一覧表示テスト', skip: true do
    click_link 'ユーザー一覧'
    save_and_open_page
    expect(page).to have_content 'ユーザ一覧'
  end

  scenario '管理画面のユーザー詳細表示テスト', skip: true do
    click_link 'test'
    save_and_open_page
    expect(page).to have_content 'ユーザの詳細'
  end

  scenario '管理画面のユーザー作成テスト', skip: true do
    click_link '新規登録'
    fill_in '名前', with: 'man'
    fill_in 'メールアドレス', with: 'man@man.com'
    fill_in 'パスワード', with: 'man'
    fill_in 'パスワード(確認)', with: 'man'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content 'ユーザ「man」を登録しました。'
  end

  scenario '管理画面のユーザー編集・更新テスト', skip: true do
    click_link 'mof'
    click_link '編集'
    fill_in '名前', with: 'mofmof'
    fill_in 'パスワード', with: 'mof'
    fill_in 'パスワード(確認)', with: 'mof'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content 'ユーザ「mofmof」を更新しました。'
  end

  scenario '管理画面のユーザー削除テスト' do
    click_link 'mof'
    click_link '削除'
    save_and_open_page
    expect(page).to have_content 'ユーザ「mof」を削除しました。'
  end

end
