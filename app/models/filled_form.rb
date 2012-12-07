class FilledForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :user
  # attr_accessible :title, :body
end
