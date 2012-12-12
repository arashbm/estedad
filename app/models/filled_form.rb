class FilledForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :user
  has_many :filled_fields
  
  after_initialize :ensure_fields, if: :persisted?

  def ensure_fields
    form.fields.each do |i|
      filled_fields.find_or_create_by_field_id!(i.id)
    end
  end
end
