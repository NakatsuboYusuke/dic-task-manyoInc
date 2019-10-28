FactoryBot.define do
  factory :task do
    title { 'test' }
    description { 'testtesttest' }
    limited_at { Time.now + 2.days }
    status { 0 }
    priority { 0 }
    created_at { Time.now + 2.days }
    user_id { 1 }
  end

  factory :second_task, class: Task do
    title { 'mof' }
    description { 'mofmofmofmof' }
    limited_at { Time.now + 1.days }
    status { 1 }
    priority { 1 }
    created_at { Time.now + 1.days }
    user_id { 1 }
  end

  factory :third_task, class: Task do
    title { 'man' }
    description { 'manmanmanman' }
    limited_at { Time.now }
    status { 2 }
    priority { 2 }
    created_at { Time.now }
    user_id { 1 }
  end

  factory :first_user do
    name { 'test' }
    email { 'test@test.com' }
    password { 'test' }
    password_confirmation { 'test' }
    admin { false }
  end

end