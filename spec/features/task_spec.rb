require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :feature do

  scenario 'タスク一覧のテスト' do
    Task.create!(title: 'test_task_01', description: 'testtesttest')
    Task.create!(title: 'test_task_02', description: 'samplesample')
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario 'タスク作成のテスト' do
    visit new_task_path
    fill_in  'Title', with: 'test_task_01'
    fill_in  'Description', with: 'testtesttest'
    click_button 'Create Task'
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'testtesttest'
    save_and_open_page
  end

  scenario 'タスク詳細のテスト' do
    Task.create!(title: 'test_task_01', description: 'testtesttest')
    visit tasks_path
    click_link '詳細'
    expect(page).to have_content 'test_task_01'
<<<<<<< HEAD
=======
    save_and_open_page
>>>>>>> b4f88989b34e9d55dff9ca4415a8a9e6055fcc15
  end

end
