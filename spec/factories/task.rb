FactoryBot.define do
  factory :task do
    title { 'test' }
    description { 'testtesttest' }
    limited_at { Time.now + 2.days }
    status { 0 }
    created_at { Time.now + 2.days }
  end

  factory :second_task, class: Task do
    title { 'mof' }
    description { 'mofmofmofmof' }
    limited_at { Time.now + 1.days }
    status { 1 }
    created_at { Time.now + 1.days }
  end

  factory :third_task, class: Task do
    title { 'man' }
    description { 'manmanmanman' }
    limited_at { Time.now }
    status { 2 }
    created_at { Time.now }
  end
end