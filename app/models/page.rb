class Page < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates :content, presence: true
  validates :title, presence: true

  has_attachments :attachments, maximum: 10
end
