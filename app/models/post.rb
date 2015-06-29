class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  validate :title_must_start_with_x

  def title_must_start_with_x
    unless title.to_s.start_with? 'X'
      errors.add(:title, 'must start with "X"')
    end
  end
end
