FactoryBot.define do

  factory :user do
    name { 'test' }
    email { 'test@test.com' }
    password { 'test' }
    password_confirmation { 'test' }
  end

  factory :second_user do
    name { 'mof' }
    email { 'mof@mof.com' }
    password { 'mof' }
    password_confirmation { 'mof' }
  end

  factory :task_a do
    title { 'test' }
    description { 'testtesttest' }
    limited_at { Time.now + 2.days }
    status { 0 }
    priority { 0 }
    created_at { Time.now + 2.days }
  end

  factory :task_b, class: Task do
    title { 'mof' }
    description { 'mofmofmofmof' }
    limited_at { Time.now + 1.days }
    status { 1 }
    priority { 1 }
    created_at { Time.now + 1.days }
  end

end
