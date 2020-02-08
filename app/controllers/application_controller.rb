# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  # I18n.localeをセットする
  def set_locale
    I18n.locale = locale_in_params ||
                  locale_in_accept_language ||
                  I18n.default_locale
  end

  # paramsに含まれる有効なlocaleを返す
  def locale_in_params
    if params[:locale].present?
      params[:locale].to_sym.presence_in(I18n.available_locales)
    end
  end

  # 環境変数HTTP_ACCEPT_LANGUAGEを順に検証し、最初に一致した有効なlocaleを返す
  def locale_in_accept_language
    i18n_languages = I18n.available_locales.map(&:to_s)

    request.env['HTTP_ACCEPT_LANGUAGE']
           .to_s
           .split(',')
           .each do |accept_lang|
      i18n_languages.each do |i18n_lang|
        return i18n_lang if accept_lang.start_with?(i18n_lang)
      end
    end

    nil
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
