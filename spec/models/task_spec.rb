require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
    
    describe 'バリデーションのテスト' do
        context 'タスクのタイトルが空の場合' do
            it 'バリデーションにひっかる' do
                task = Task.new(title: '', content: '失敗テスト')
                expect(task).not_to be_valid
            end
        end
    end
    context 'タスクの詳細が空の場合' do
        it 'バリデーションにひっかかる' do
            task = Task.new(title: '失敗テスト２',content: '')
            expect(task).not_to be_valid
        end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
            task = Task.new(title: '成功テスト',content: '成功テスト')
            expect(task).to be_valid
        end
    end
    describe '検索機能' do
        # 必要に応じて、テストデータの内容を変更して構わない
        let!(:task) { FactoryBot.create(:task, title: 'task',status: '完了') }
        let!(:second_task) { FactoryBot.create(:second_task, title: "sample",status: '着手中') }
        context 'scopeメソッドでタイトルのあいまい検索をした場合' do
            it "検索キーワードを含むタスクが絞り込まれる" do
                # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
                expect(Task.get_by_title('task')).to include(task)
                expect(Task.get_by_title('task')).not_to include(second_task)
                expect(Task.get_by_title('task').count).to eq 1
            end
        end
    end
    let!(:task) { FactoryBot.create(:task, title: 'task',status: '完了') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample",status: '着手中') }
    context 'scopeメソッドでステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
            expect(Task.get_by_status('完了')).to include(task)
            expect(Task.get_by_status('完了')).not_to include('second_task')
            expect(Task.get_by_status('完了').count).to eq 1

        end
    end
    let!(:task) { FactoryBot.create(:task, title: 'task',status: '完了') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample",status: '着手中') }
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
            expect(Task.get_by_title('task')).to include(task)
            expect(Task.get_by_title('task')).not_to include(second_task)
            expect(Task.get_by_title('task').count).to eq 1
            expect(Task.get_by_status('完了')).to include(task)
            expect(Task.get_by_status('完了')).not_to include(second_task)
            expect(Task.get_by_status('完了').count).to eq 1
            
        end
    end
end
