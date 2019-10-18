require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :feature do
  background do
    @task = FactoryBot.create(:task, created_at: Time.now + 2.days)
    @second_task = FactoryBot.create(:second_task, created_at: Time.now + 1.days)
    @third_task = Task.create(title: 'man', description: 'manmanmanman', created_at: Time.now)
  end

  scenario 'タスク一覧のテスト' do
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'mofmofmofmof'
  end

  scenario 'タスク作成のテスト', skip: true do
    visit new_task_path
    fill_in  '名称', with: 'test_task_01'
    fill_in  '詳しい説明', with: 'testtesttest'
    click_button 'Create Task'
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'testtesttest'
  end

  scenario 'タスク詳細のテスト', skip: true do
    visit tasks_path
    click_link '詳細'
    expect(page).to have_content 'test_task_01'
  end

  scenario 'タスクが作成日時の降順に並んでいるかのテスト' do
    visit tasks_path
    @tasks = all('tbody tr')
    expect(@tasks[0]).to have_content 'test'
    expect(@tasks[2]).to have_content 'man'
    save_and_open_page
  end
end
