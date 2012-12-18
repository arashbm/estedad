class Admins::FilledFormsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :get_form
  def index
    @filled_forms = @form.filled_forms
    respond_with(:admins, @form, @filled_forms)
  end

  def show
    @filled_form = @form.filled_forms.find(params[:id])
    respond_with(:admins, @form, @filled_form)
  end

  def new
    @filled_form = @form.filled_forms.new
    respond_with(:admins, @form, @filled_form)
  end

  def edit
    @filled_form = @form.filled_forms.find(params[:id])
  end

  def create
    @filled_form = @form.filled_forms.create(params[:filled_form], as: :admin)
    respond_with(:admins, @form, @filled_form, location: edit_form_filled_form_path(@form, @filled_form))
  end

  def update
    @filled_form = @form.filled_forms.find(params[:id])
    @filled_form.update_attributes(params[:filled_form], as: :admin)
    respond_with(:admins, @form, @filled_form)
  end

  def destroy
    @filled_form = @form.filled_forms.find(params[:id])
    @filled_form.destroy
    respond_with(:admins, @form, @filled_form)
  end

  private

  def get_form
    @form = Form.find params[:form_id]
  end
end
