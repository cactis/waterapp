
require "awesome_print"
class ApplicationController < ActionController::API
  # before_action :authenticate_user!

  before_action :set_current_user
  before_action :init_params
  before_action :log_params#, excepts: [:create]
  # before_action :check_authorization_token

  def set_current_user
    if user = User.find_by_token(authorization_token)
      log user, '111'
      User.current = user
    elsif development?
      log User.current, '222'
      # User.current
    else
      raise InvalidToken
    end
    # log User.current, 'User.current'
  end

  def development?; ["development"].include? Rails.env; end
  # def development?; `hostname` == "MBPR-15.local\n"; end

  def routes; request.fullpath.split('/'); end
  def parent_class
    if routes[routes.rindex(controller_name) - 2].present?
      routes[routes.rindex(controller_name) - 2].classify.constantize
    end
  end
  def parent_id; routes[routes.rindex(controller_name) - 1].to_i; end
  def parent; parent_class ? parent_class.find(parent_id) : nil; end
  def resource_class; controller_name.classify.constantize; end
  def resource; resource_class.find(params[:id]); end

  def render_error_message(e, status = 400)
    render json: { message: e.message.gsub(": ", ":\n").gsub(", ", "\n")}, status: status
  end

  class InvalidToken < StandardError
    def message
      "登入憑證已失效，請重新登入。"
    end
  end
  rescue_from InvalidToken, with: :invalid_token
  def invalid_token(e)
    render_error_message e, 440
  end

  def init_params
    app_id = request.headers["HTTP_APP_ID"]
    file_name = request.headers["HTTP_FILE_NAME"]
    func_name = request.headers["HTTP_FUNC_NAME"]
    params[:app_id] = app_id
    params[:token] = authorization_token
    params[:file_name] = file_name
    params[:func_name] = func_name
  end

  def log_params
    log params, 'params'
  rescue
    # log params, ['params', __method__]
  end

  def current_user
    User.current
  end

  def authorization_token
    request.headers["HTTP_AUTHORIZATION"]
  end

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
  # alias_method :log, :debug

end


# ActionController::Renderers.add :json do |json, options|
#   unless json.kind_of?(String)
#     json = json.as_json(options) if json.respond_to?(:as_json)
#     json = JSON.pretty_generate(json, options)
#   end

#   if options[:callback].present?
#     self.content_type ||= Mime::JS
#     "#{options[:callback]}(#{json})"
#   else
#     self.content_type ||= Mime::JSON
#     json
#   end
# end

# class ApplicationController < ActionController::API

#   def log(msg, title = 'debug info')
#     # return unless development?
#     Rails.logger.ap '-'*30 + '-> ' + title.to_s
#     if msg.is_a? Hash
#       f = ActionDispatch::Http::ParameterFilter.new(Rails.application.config.filter_parameters)
#       msg = f.filter msg
#     end
#     Rails.logger.ap msg.respond_to?(:to_h) ? msg.to_h : msg
#     Rails.logger.ap '-'*30 + '-> ' + title.to_s
#   end
# end
