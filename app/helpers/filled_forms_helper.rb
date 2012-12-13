module FilledFormsHelper
  def fill_new_btn(form)
    link_to t('.fill_new_html'), new_form_filled_form_path(form), class: 'btn'
  end
end
