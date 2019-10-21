FactoryBot.define do
  factory :task do
    title { 'test' }
    description { 'testtesttest' }
  end

  factory :second_task, class: Task do
    title { 'mof' }
    description { 'mofmofmofmof' }
  end

  factory :third_task, class: Task do
    title { 'man' }
    description { 'manmanmanman' }
  end
end