# -*- encoding : utf-8 -*-
module UserExtend
  def current
    Thread.current[:user] ||= dev_user
  end

  def dev_user
    # development? ? User.first : nil
    User.first
  end

  def current=(user=nil)
    raise(ArgumentError, "傳入參數必需為 User 物件.") unless user.is_a?(User) || user.nil?
    Thread.current[:user] = user
  end

  # def development?
  #   `hostname` == "MBPR-15.local\n"
  # end

end
