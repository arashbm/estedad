class Admins::FieldsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :get_form

  def index
    @fields = @form.fields
    respond_with(:admins, @form, @fields)
  end

  def show
    @field = @form.fields.find(params[:id])
    respond_with(:admins, @form, @field)
  end

  def new
    @field = @form.fields.new
    respond_with(:admins, @form, @field)
  end

  def edit
    @field = @form.fields.find(params[:id])
  end

  def create
    @field = @form.fields.new(params[:field])
    @field.save
    respond_with :admins, @form, @field, location: admins_form_path(@form)
  end

  def update
    @field = @form.fields.find(params[:id])
    @field.update_attributes(params[:field])
    respond_with :admins, @form, @field, location: admins_form_path(@form)
  end

  def destroy
    @field = @form.fields.find(params[:id])
    @field.destroy
    respond_with :admins, @form, @field, location: admins_form_path(@form)
  end

  def sort
    params[:field].each_with_index do |id, index|
      @form.fields.update_all({position: index.to_i}, {id: id.to_i})
    end
    render nothing: true
  end

  private
  def get_form
    @form = Form.find params[:form_id]
  end
end
