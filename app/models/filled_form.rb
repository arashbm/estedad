class FilledForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :user

  has_many :filled_fields, include: :field, order: 'fields.position'
  accepts_nested_attributes_for :filled_fields

  validates :user, presence: true

  attr_accessible :filled_fields_attributes
  attr_accessible :filled_fields_attributes, :user_id, as: :admin

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
