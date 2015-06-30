class Tag < ActiveRecord::Base
  #has_and_belongs_to_many :posts

  has_many :post_tagships
  has_many :posts, :through => :post_tagships

  validates :name, presence: true
end
