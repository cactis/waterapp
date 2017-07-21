
class ApplicationController < ActionController::API

  def log(msg, title = 'debug info')
    # return unless development?
    Rails.logger.ap '-'*30 + '-> ' + title.to_s
    if msg.is_a? Hash
      f = ActionDispatch::Http::ParameterFilter.new(Rails.application.config.filter_parameters)
      msg = f.filter msg
    end
    Rails.logger.ap msg.respond_to?(:to_h) ? msg.to_h : msg
    Rails.logger.ap '-'*30 + '-> ' + title.to_s
  end
end
