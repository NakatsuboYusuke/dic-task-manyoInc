require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :feature do
  #background do
    #FactoryBot.create(:task, created_at: Time.now + 2.days)
    #FactoryBot.create(:second_task, created_at: Time.now + 1.days)
    #FactoryBot.create(:third_task, created_at: Time.now)
  #end

  scenario 'タスク一覧のテスト', skip: true do
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'mofmofmofmof'
  end

  scenario 'タスク作成のテスト' do
    visit new_task_path
    fill_in '名称', with: 'test_task_01'
    fill_in '詳しい説明', with: 'testtesttest'
    click_button 'Create Task'
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'testtesttest'
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
    save_and_open_page
  end

  #scenario '日時の作成のテスト' do
    #visit new_task_path
    #fill_in  '名称', with: 'test_task_01'
    #fill_in  '詳しい説明', with: 'testtesttest'
    #fill_in datetimeinput, with: '1990-12-31T23:59Z'
    #click_button 'Create Task'
    #expect(page).to have_content '1990-12-31T23:59Z'
  #end
end
