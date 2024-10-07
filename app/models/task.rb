class Task < ApplicationRecord
    validates :title, presence: true
    validates :content,presence: true
    enum status: { 未着手: 0, 着手中: 1,完了: 2}
    enum priority: { 高: 0, 中: 1,低: 2}
    scope :get_by_title, ->(title) { where('title LIKE ?', "%#{title}%")}
    scope :get_by_status, ->(status) { where(status: status)}
end
