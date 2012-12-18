module ApplicationHelper
  def filled_form_navbar_item(form)
    count = form.filled_forms.where( state: [nil, :not_reviewed] ).count
    if count > 0
      "#{h form.title} <i class='badge'>#{count}</i>".html_safe
    else
      form.title
    end
  end
  def flash_class(level)
    case level
    when :notice then "success"
    when :error then "error"
    when :alert then "warning"
    end
  end
  def localize_date(object, options= { format: :default })
    type = object.respond_to?(:sec) ? 'time' : 'date'
    str_format = I18n.t("jalali.#{type}.formats.#{options[:format].to_s}")
    JalaliDate.new(object).strftime(str_format)
  end
end
