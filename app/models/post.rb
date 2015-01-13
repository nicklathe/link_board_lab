class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
    presence: true,
    length: {in: 1..100}

  validates :link,
    presence: true
    # :with => URI::regexp(%w(http https))
end
