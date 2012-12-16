module FieldsHelper
  def translated_types(field)
    I18n.t(field.type.to_sym, scope: "simple_form.options.field.type")
  end
end
