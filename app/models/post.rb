class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, class_name: 'Tag'
  validates :title, :content, presence: true
  before_validation :set_published_at, on: :create
  
  def set_published_at
    self.published_at ||= Time.current
  end
end