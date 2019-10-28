require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :feature do
  background do
    FactoryBot.create(:user, name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test', admin: true)
    #FactoryBot.create(:task)
    #FactoryBot.create(:second_task)
    #FactoryBot.create(:third_task)
    visit root_path
    fill_in 'メールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: 'test'
    click_button 'ログインする'
  end

  scenario 'タスク一覧のテスト', skip: true do
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'mofmofmofmof'
  end

  scenario 'タスク作成のテスト', skip: true do
    visit new_task_path
    fill_in '名称', with: 'test_task_01'
    fill_in '詳しい説明', with: 'testtesttest'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content 'test_task_01'
  end

  scenario 'タスク詳細のテスト', skip: true do
    visit tasks_path
    click_link '詳細'
    expect(page).to have_content 'test_task_01'
  end

  scenario 'タスクが作成日時の降順に並んでいるかのテスト', skip: true do
    visit tasks_path
    @tasks = all('tbody tr')
    expect(@tasks[0]).to have_content 'test'
    expect(@tasks[2]).to have_content 'man'
  end

  scenario '日時の作成のテスト', skip: true do
    visit new_task_path
    fill_in '名称', with: 'test_task_01'
    fill_in '詳しい説明', with: 'testtesttest'
    select '2019', from: 'task[limited_at(1i)]'
    select '12', from: 'task[limited_at(2i)]'
    select '31', from: 'task[limited_at(3i)]'
    select '23', from: 'task[limited_at(4i)]'
    select '59', from: 'task[limited_at(5i)]'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content '2019-12-31 23:59'
  end

  scenario 'タスクが終了期限でソートできるかのテスト', skip: true do
    visit tasks_path
    click_link '終了期限でソートする'
    @tasks = all('tbody tr')
    save_and_open_page
    expect(@tasks[0]).to have_content 'man'
    expect(@tasks[2]).to have_content 'test'
  end

  scenario 'タスクが優先順位でソートできるかのテスト', skip: true do
    visit tasks_path
    click_link '優先順位でソートする'
    @tasks = all('tbody tr')
    save_and_open_page
    expect(@tasks[0]).to have_content 'test'
    expect(@tasks[2]).to have_content 'man'
  end

  scenario 'エラーページの表示テスト', skip: true do
    visit user_path(777)
    save_and_open_page
    expect(page).to have_content '404 Not Found'
  end

end
