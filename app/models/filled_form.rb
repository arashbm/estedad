class FilledForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :user

  has_many :filled_fields
  accepts_nested_attributes_for :filled_fields

  attr_accessible :filled_fields_attributes

  after_initialize :ensure_fields, if: :persisted?

  def state
    'dummy'
  end

  def ensure_fields
    form.fields.each do |i|
      filled_fields.find_or_create_by_field_id!(i.id)
    end
  end
end
