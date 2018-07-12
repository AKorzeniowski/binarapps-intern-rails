class Comment < ActiveRecord::Base
  validates :commenter_name, :content, :post_id, presence: true
  validates :commenter_name, length: 3..32
  validates :content, length: 5..128

  belongs_to :post
end