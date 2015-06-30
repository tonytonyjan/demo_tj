class Post < ActiveRecord::Base

  validates :title, :content, presence: true
  before_validation :set_content_from_title
  #validate :title_must_start_with_x
  #has_and_belongs_to_many :tags
  has_many :post_tagships
  has_many :tags, :through => :post_tagships
  
  belongs_to :user

  def title_must_start_with_x
    unless title.to_s.start_with? 'X'
      errors.add(:title, 'must start with "X"')
    end
  end

  def set_content_from_title
    self.content = title if content.blank?
  end
end
