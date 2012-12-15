class FilledField < ActiveRecord::Base
  belongs_to :field
  belongs_to :filled_form

  attr_accessible :value, :attachments
  attr_accessible :value, :attachments, as: :admin

  validates :field, presence: true

  validate :being_numerical
  validate :being_included

  has_attachments :attachments, maximum: 10

  private

  def being_included
    if !value.blank? && field.validations.include?('inclusion')
      errors.add(:value, :inclusion) unless field.option('collection').include? value
    end
  end

  def being_numerical
    if !value.blank? && field.validations.include?('numericality')
      min = field.option('min')
      max = field.option('max')
      step = field.option('step').to_f
      begin
        new_val = Float(value)
      rescue TypeError
        errors.add(:value, :not_a_number) and return 
      end
      value = new_val
      value = (value / step).to_i * step if step != 0.0
      if min && value < min
        errors.add(:value, :greater_than_or_equal_to, count: min )
      end
      if max && value > max
        errors.add(:value, :less_than_or_equal_to, count: max)
      end
    end
  end
end
