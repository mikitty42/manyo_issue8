FactoryBot.define do
    factory :task do
        title { 'test1' }
        content { 'content1' }
        end_date { '2024-10-01'}
      end
      # 作成するテストデータの名前を「second_task」とします
      # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
      factory :second_task, class: Task do
        title { 'test2' }
        content { 'content2' }
        end_date { '2024-10-30'}

  end
end
