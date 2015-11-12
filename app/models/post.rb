class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user


  scope :order_by_title, -> { order(:title) }
  scope :order_by_reverse_created_at, -> { order(:created_at).reverse }
end
