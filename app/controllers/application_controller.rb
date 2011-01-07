class ApplicationController < ActionController::Base
  before_filter :set_locale

  protected

  def set_locale
    I18n.locale = params[:locale] || :en
  end
end
