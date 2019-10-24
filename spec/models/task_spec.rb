require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない", skip: true do
    task = Task.new(title: '', description: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "descriptionが空ならバリデーションが通らない", skip: true do
    task = Task.new(title: '失敗テスト', description: '')
    expect(task).not_to be_valid
  end

  it "titleとdescriptionに内容が記載されていればバリデーションが通る", skip: true do
    task = Task.new(title: '成功テスト', description: '成功テスト')
    expect(task).to be_valid
  end

  it "title検索ができる" do
    task = Task.create(title: '成功テスト', description: '成功テスト', limited_at: Time.now + 2.days, status: 0)
    params = Hash.new
    params[:q] = Hash.new
    params[:q][:title_cont] = '成功テスト'
    result = Task.set_index(params)
    expect(task.title).to eq result[0][:title]
  end

  it "status検索ができる" do
    task = Task.create(title: '成功テスト', description: '成功テスト', limited_at: Time.now + 2.days, status: 0)
    params = Hash.new
    params[:q] = Hash.new
    params[:q][:status] = 0
    result = Task.set_index(params)
    expect(task.status).to eq result[0][:status]
  end

  it "title検索とstatus検索ができる" do
    task = Task.create(title: '成功テスト', description: '成功テスト', limited_at: Time.now + 2.days, status: 0)
    params = Hash.new
    params[:q] = Hash.new
    params[:q][:status] = 0
    result = Task.set_index(params)
    expect(task.title).to eq result[0][:title]
    expect(task.status).to eq result[0][:status]
  end
end

