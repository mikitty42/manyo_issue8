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
          click_on '登録する'
          expect(page).to have_content 'task_title'
          expect(page).to have_content 'task_content'
          expect(page).to have_content "2019-11-11"
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
end
