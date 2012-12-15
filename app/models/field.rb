# encoding: UTF-8
class Field < ActiveRecord::Base
  belongs_to :form
  attr_accessible :data, :description, :name, :type, :min, :max, :min_char_limit, :max_char_limit, :collection, :steps, :multiple

  store :data, accessors: [ :min, :max, :min_char_limit, :max_char_limit, :collection, :steps, :multiple ]

  validates :type, presence: true, inclusion: { in: Rails.configuration.field_types.keys }

  after_initialize :set_defaults

  def splited_collection
    return nil unless option('collection')
    col = option('collection').split(',').map{|e| e.split('،')}.flatten.map(&:strip)
    return col
  end

  def set_defaults
    return unless field_type['default']
    field_type['default'].each_pair do |key, val|
      data[key] = val if data[key].blank?
    end
  end

  def self.inheritance_column
    :inh_type
  end

  def field_type
    Rails.configuration.field_types[type.to_s]
  end

  def input_type
    field_type['as'].to_sym
  end

  def visible_options
    field_type['options']
  end

  def option(name)
    name=name.to_s
    data[name.to_sym] || field_type.try(:[],'default').try(:[],name)
  end

  def validations
    if field_type['validations'].kind_of?(Array)
      field_type['validations']
    else
      [field_type['validations']]
    end
  end
end
