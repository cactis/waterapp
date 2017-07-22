# -*- encoding : utf-8 -*-
class ActiveRecord::Base
  #  site_id = current_site
  #  default_scope :conditions => ["site_id = ?", eval("#{ActiveRecord::Base::get_current_site}")]

  # WillPaginate::ViewHelpers.pagination_options[:previous_label] = '«'
  # WillPaginate::ViewHelpers.pagination_options[:next_label] = "»"

  # cattr_reader :per_page
  # @@per_page = 10

  def get_unique_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless self.class.exists?(token: token)
    end
  end

  def renew_token!
    update_attribute("token", get_unique_token)
    return token
  end

  def validate_token
    return token || renew_token!
  end


  before_create do |record|
    if record.has_attribute?(:token) && record.token == nil
      record.token = record.get_unique_token
    end

    if record.has_attribute?(:user_id) && record.user_id == nil
      # if development?
      #   User.current ||= User.first
      # end
      record.user_id = User.current.id if User.current
    end
  end

  def save_without_timestamping
    class << self
      def record_timestamps; false; end
    end
    save
    class << self
      def record_timestamps; super ; end
    end
  end

  def is_owner?
    if User.current
      user_id == User.current.id
    else
      false
    end
  end

  def self.development?
    ["development", "stage"].include? Rails.env
  end

  def development?
    self.class.development?
  end

  def self.log(*args)
    return unless development?
    title ||= ""
    Rails.logger.ap '-' * 20 + calling_method + '-' * 20
    Rails.logger.ap args
    Rails.logger.ap '-' * 100
  end

  def log(*args)
    return unless development?
    title ||= ""
    Rails.logger.ap '-' * 20 + calling_method + '- in model'
    Rails.logger.ap args
    Rails.logger.ap '-' * 100
  end

end
