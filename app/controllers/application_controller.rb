# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |error|
    Rails.logger.error(error.inspect)
    render json: { error: I18n.t('errors.record_not_found', model: error.model, id: error.id) }, status: 404
  end
end
