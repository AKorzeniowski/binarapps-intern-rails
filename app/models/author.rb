class Author < ActiveRecord::Base
  validates :name, :surname, :age, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }

  # has_many :author_posts
  # has_many :posts, through: :author_posts
  has_many :posts
  has_many :comments


  def fullname
    "#{name} #{surname}"
  end
end