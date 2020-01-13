# frozen_string_literal: true

class RequestsController < ApplicationController
  add_flash_types :success, :info, :warning, :danger

  def index
    @requests = Request.order(:status).order(updated_at: :desc).all
  end

  def create
    @request = Request.new(request_params)
    begin
      @request.save!
      redirect_to root_path, success: t('.success_message')
    rescue => error
      raise error if @request.errors.empty?
      flash[:danger] = @request.errors.full_messages
      redirect_to new_request_path(request: request_params)
    end
  end

  def new
    @request = Request.new

    #validationで引っかかって戻された場合、入力されていた値を復元する
    begin
      @request.attributes = request_params
    rescue ActionController::ParameterMissing
      # ignored
    end

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

    #validationで引っかかって戻された場合、入力されていた値を復元する
    begin
      @request.attributes = request_params
    rescue ActionController::ParameterMissing
      # ignored
    end

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
    begin
      @request.update!(request_params)
      redirect_to root_path, notice: t('.success_message')
    rescue => error
      raise error if @request.errors.empty?
      flash[:danger] = @request.errors.full_messages
      redirect_to edit_request_path(id: params[:id], request: request_params)
    end
  end

  def destroy
    @request = Request.find_by!(id: params[:id])
    @request.destroy!
    redirect_to root_path, notice: t('.success_message')
  end

  def request_params
    params
        .require(:request)
        .permit(:product_name, :description, :repository_url, :status)
  end
end
