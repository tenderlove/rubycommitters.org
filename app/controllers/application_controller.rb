class ApplicationController < ActionController::Base
  around_filter :set_locale

  protected

  def preferred_language
    languages = request.env['HTTP_ACCEPT_LANGUAGE'].to_s
    languages = languages.split(',').collect do |language|  # Parse each possible language.
      language, quality = language.split(';').map(&:strip)  # Split the language name and quality.

      if quality.present?                                   # Parse the quality, if present.
        quality = quality.split('=').last.strip.to_f
      end

      [language, quality || 1.0]                            # Default the quality to the highest.
    end
    languages.sort! { |a, b| b.last <=> a.last }            # Sort the languages by quality, descending.
    languages  = languages.map(&:first)                     # Just keep the language names.
    languages &= %w(en ja)                                  # Remove unsupported languages.
    languages.first                                         # Return the highest quality language remaining.
  end

  def set_locale
    I18n.locale = params[:locale] || preferred_language || :en

    yield

    I18n.locale = :en
  end
end
