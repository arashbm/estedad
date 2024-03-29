# encoding: UTF-8
module FilledFormsHelper

  def fill_new_btn(form)
    if current_user && current_user.fillable_forms.include?(form)
      link_to t('.fill_new_html'), new_form_filled_form_path(form), class: 'btn'
    else
      link_to t('.fill_new_html'), '#', class: 'btn disabled'
    end
  end

  def translated_state(ff)
    I18n.t(ff.state.to_sym, scope: "simple_form.options.filled_form.state")
  end

  def state_class(ff)
    case ff.state.to_sym
    when :not_reviewed
      'default'
    when :reviewed
      'info'
    when :review_failed
      'important'
    when :processing
      'info'
    when :process_failed
      'important'
    when :successful
      'success'
    end
  end

  def state_label(ff)
    content_tag :i, translated_state(ff), class: "label label-#{state_class(ff)}"
  end

  def filled_field_value(filled_field)
    if filled_field.field.type == 'attachinary_file'
      filled_field.attachments.map do |a|
        "<a target='_blank' href='http://res.cloudinary.com/#{Cloudinary.config.cloud_name}/image/upload/#{a.path}'>#{cl_image_tag(a.path, { size: '75x75', crop: :fill, format: :jpg })}</a>" 
      end.inject(:+).try(:html_safe)
    else
      filled_field.value
    end
  end
end
