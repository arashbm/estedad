class FormsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @forms = current_user.visible_forms
    respond_with(@forms)
  end

  def show
    @form = current_user.visible_forms.find(params[:id])
    respond_with(@form)
  end
end
