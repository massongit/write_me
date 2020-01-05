# frozen_string_literal: true

class RequestsController < ApplicationController
  add_flash_types :success, :info, :warning, :danger

  def index
    @requests = Request.order(:status).order(updated_at: :desc).all
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
           locals: { request: @request,
                     mode: 'add',
                     submit_text: t('action.add'),
                     disabled: false }
  end

  def edit
    @request = Request.find_by!(id: params[:id])
    render template: 'shared/_form',
           layout: 'application',
           locals: { request: @request,
                     mode: 'edit',
                     submit_text: t('action.update'),
                     disabled: false }
  end

  def show
    @request = Request.find_by!(id: params[:id])
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
