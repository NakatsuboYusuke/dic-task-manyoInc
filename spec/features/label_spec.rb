require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :feature do
  background do
    FactoryBot.create(:user, name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test', admin: true)
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
  end

  scenario 'ラベルを作成・表示できるのかテスト', skip: true do
    visit new_task_path
    fill_in '名称', with: 'test_task_01'
    fill_in '詳しい説明', with: 'testtesttest'
    fill_in 'task[term]', with: 'test01,test02'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content 'test01'
    expect(page).to have_content 'test02'
  end

  scenario 'ラベルを編集できるのかテスト', skip: true do
    visit new_task_path
    fill_in '名称', with: 'test_task_01'
    fill_in '詳しい説明', with: 'testtesttest'
    fill_in 'task[term]', with: 'test01,test02'
    click_button '登録する'
    visit edit_task_path(1)
    fill_in 'task[term]', with: 'test01,test02,test03'
    click_button '更新する'
    save_and_open_page
    expect(page).to have_content 'test01'
    expect(page).to have_content 'test02'
    expect(page).to have_content 'test03'
  end

  scenario 'ラベルを検索できるのかテスト' do
    visit new_task_path
    fill_in '名称', with: 'test_task_01'
    fill_in '詳しい説明', with: 'testtesttest'
    fill_in 'task[term]', with: 'test01'
    click_button '登録する'
    visit tasks_path
    check 'q_labels_id_eq_any_1'
    click_button '検索'
    save_and_open_page
    expect(page).to have_content 'test01'
  end

end
