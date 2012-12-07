class FormsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @forms = Form.all
    respond_with(@forms)
  end

  def show
    @form = Form.find(params[:id])
    respond_with(@form)
  end
end
