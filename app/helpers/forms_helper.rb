module FormsHelper
  def not_enabled_alert
    content_tag :div, I18n.t('forms.not_enabled_html').html_safe, class: 'alert'
  end

  def link_to_admin_filled_fields(form)
    link_to t('.filled_form_count',
              count: form.filled_forms.count,
              not_reviewed_count: form.filled_forms.where(state: 'not_reviewed').count), admins_form_filled_forms_path(form)
  end
end
