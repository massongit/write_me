# frozen_string_literal: true

class RequestsController < ApplicationController
  add_flash_types :success, :info, :warning, :danger

  def index
    @requests = Request.order(:status).order(created_at: :desc).all
  end

  def create
    @request = Request.new(request_params)
    @request.save!
    redirect_to '/requests', success: t('request.added')
  end

  def new
    @request = Request.new
    render template: 'shared/_form',
           layout: 'application',
           locals: { request: @request, mode: 'add', disabled: false }
  end

  def edit
    @request = Request.find_by!(id: params[:id])
    render template: 'shared/_form',
           layout: 'application',
           locals: { request: @request, mode: 'edit', disabled: false }
  end

  def show
    @request = Request.find_by!(id: params[:id])
    render template: 'shared/_form',
           layout: 'application',
           locals: { request: @request, mode: 'details', disabled: true }
  end

  def update
    @request = Request.find_by!(id: params[:id])
    @request.update!(request_params)
    redirect_to '/requests', notice: t('request.updated')
  end

  def destroy
    @request = Request.find_by!(id: params[:id])
    @request.destroy!
    redirect_to '/requests', notice: t('request.deleted')
  end

  def request_params
    params
      .require(:request)
      .permit(:product_name, :description, :repository_url, :status)
  end
end
