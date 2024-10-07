require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
    let!(:task) { FactoryBot.create(:task, title: 'task1') }
    
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
          visit new_task_path
          fill_in 'Title' ,with: 'task_title'
          fill_in 'Content', with: 'task_content'
          fill_in 'End date', with: "002019-11-11"
          select '完了',from: 'task_status'
          select '中',from: 'task_priority'
          click_on '登録する'
          expect(page).to have_content 'task_title'
          expect(page).to have_content 'task_content'
          expect(page).to have_content "2019-11-11"
          expect(page).to have_content "完了"
          expect(page).to have_content "中"
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
          visit tasks_path
          expect(page).to have_content 'task1'

      end
    end
  end
  context 'タスクが作成日時の降順に並んでいる場合' do
        it '新しいタスクが一番上に表示される' do
          FactoryBot.create(:task, title: 'task2')
          FactoryBot.create(:task, title: 'task3')
          visit tasks_path
          list = all('.task_list')[0]
          expect(list).to have_content 'task3'
        end
      end
  context '終了期限でソートした場合' do
        it '終了期限の降順に並び替えられたタスク一覧が表示される' do
          FactoryBot.create(:task, end_date: '2024-09-28')
          FactoryBot.create(:task, end_date: '2024-09-30')
          visit tasks_path
          click_on '終了期限でソートする'
          list = all('.task_list')[0]
          expect(list).to have_content '2024-10-01'
        end
      end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
           
           visit tasks_path
           click_on 'タスク詳細'
           expect(page).to have_content 'task1'
       end
     end
  end
  describe '検索機能' do
      #before do
        # 必要に応じて、テストデータの内容を変更して構わない
        #FactoryBot.create(:task, title: "task")
        #FactoryBot.create(:second_task, title: "sample")
      #end

      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むタスクで絞り込まれる" do
          visit tasks_path
          fill_in 'タイトル検索', with: 'task1'
          click_button '検索'
          expect(page).to have_content 'task1'
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          visit tasks_path
          select '完了',from: 'task_status'
          expect(page).to have_content '完了'
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          visit tasks_path
          fill_in 'タイトル検索', with: 'task1'
          select '未着手',from: 'task_status'
          expect(page).to have_content 'task1'
          expect(page).to have_content '未着手'
        end
      end
    end
end
