require 'rails_helper'

RSpec.feature 'ユーザー管理機能', type: :feature do
  background do
    user_a = FactoryBot.create(:user, name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
    user_b = FactoryBot.create(:user, name: 'mof', email: 'mof@mof.com', password: 'mof', password_confirmation: 'mof')
    FactoryBot.create(:task, title: 'test', description: 'testtesttest', limited_at: Time.now, status: 0, priority: 0, user: user_a)
    FactoryBot.create(:task, title: 'mof', description: 'mofmofmofmof', limited_at: Time.now, status: 1, priority: 1, user: user_b)
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

  scenario '自分以外のユーザのマイページに行かせないテスト' do
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
    visit user_path(2)
    save_and_open_page
    expect(page).to have_content 'タスク一覧'
  end

end
