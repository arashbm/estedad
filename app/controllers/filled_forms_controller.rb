class FilledFormsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_form
  
  def index
    respond_with(@form, @filled_forms)
  end

  def show
    @filled_form = @filled_forms.find(params[:id])
    respond_with(@form, @filled_form)
  end

  def new
    @filled_form = @filled_forms.new
    respond_with(@form, @filled_form)
  end

  def edit
    @filled_form = @filled_forms.find(params[:id])
  end

  def create
    @form = current_user.fillable_forms.find params[:form_id]
    @filled_forms = @form.filled_forms.where(user_id: current_user.id)
    @filled_form = @filled_forms.create(params[:filled_form])
    respond_with @form, @filled_form, location: edit_form_filled_form_path(@form, @filled_form)
  end

  def update
    @filled_form = @filled_forms.find(params[:id])
    @filled_form.update_attributes(params[:filled_form])
    respond_with(@form, @filled_form)
  end

  def destroy
    @filled_form = @filled_forms.find(params[:id])
    @filled_form.destroy
    respond_with(@form, @filled_form)
  end

  private

  def get_form
    @form = current_user.visible_forms.find params[:form_id]
    @filled_forms = @form.filled_forms.where(user_id: current_user.id)
  end
end
