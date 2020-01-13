# frozen_string_literal: true

class RequestsController < ApplicationController
  add_flash_types :success, :info, :warning, :danger

  def index
    @requests = Request.order(:status).order(updated_at: :desc).all
  end

  def create
    @request = Request.new(request_params)
    @request.save!
    redirect_to requests_path, success: t('.success_message')
  end

  def new
    @request = Request.new
    render template: 'shared/_form',
           layout: 'application',
           locals: { request: @request,
                     title: t('.title'),
                     submit_text: t('.add'),
                     disabled: false,
                     show_updated_at: false }
  end

  def edit
    @request = Request.find_by!(id: params[:id])
    render template: 'shared/_form',
           layout: 'application',
           locals: { request: @request,
                     title: t('.title'),
                     submit_text: t('.update'),
                     disabled: false,
                     show_updated_at: false }
  end

  def show
    @request = Request.find_by!(id: params[:id])
  end

  def update
    @request = Request.find_by!(id: params[:id])
    @request.update!(request_params)
    redirect_to requests_path, notice: t('.success_message')
  end

  def destroy
    @request = Request.find_by!(id: params[:id])
    @request.destroy!
    redirect_to requests_path, notice: t('.success_message')
  end

  def request_params
    params
      .require(:request)
      .permit(:product_name, :description, :repository_url, :status)
  end
end
