class FilledForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :user

  has_many :filled_fields, include: :field, order: 'fields.position'
  accepts_nested_attributes_for :filled_fields

  validates :user, presence: true
  validates :state, presence: true

  attr_accessible :filled_fields_attributes
  attr_accessible :filled_fields_attributes, :user_id, :state, as: :admin

  after_initialize :ensure_fields, if: :persisted?
  before_validation :ensure_state

  def ensure_state
    self.state ||= :not_reviewed
  end

  def ensure_fields
    form.fields.each do |i|
      filled_fields.find_or_create_by_field_id!(i.id)
    end
  end
end
