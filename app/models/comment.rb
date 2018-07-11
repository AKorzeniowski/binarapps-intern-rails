class Comment < ActiveRecord::Base
  validates :commenter_id, :content, presence: true
  validates :content, length: 5..128

  belongs_to :commenter
  belongs_to :post
end