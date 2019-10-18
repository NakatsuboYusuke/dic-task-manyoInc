FactoryBot.define do
  factory :task do
    title { 'test' }
    description { 'testtesttest' }
  end

  factory :second_task, class: Task do
    title { 'mof' }
    description { 'mofmofmofmof' }
  end
end