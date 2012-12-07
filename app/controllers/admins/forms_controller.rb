class Admins::FormsController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @forms = Form.all
    respond_with(:admins, @forms)
  end

  def show
    @form = Form.find(params[:id])
    respond_with(:admins, @form)
  end

  def new
    @form = Form.new
    respond_with(:admins, @form)
  end

  def edit
    @form = Form.find(params[:id])
  end

  def create
    @form = Form.new(params[:form])
    @form.save
    respond_with(:admins, @form)
  end

  def update
    @form = Form.find(params[:id])
    @form.update_attributes(params[:form])
    respond_with(:admins, @form)
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_with(:admins, @form)
  end
end
