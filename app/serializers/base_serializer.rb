class BaseSerializer < ActiveModel::Serializer
  # cache

  include Rails.application.routes.url_helpers

  attributes :url

  Rails.application.routes.default_url_options = {
    host: Settings.host
  }

  # def self.with_option(types)
  #   types.each do |type|
  #     class_eval "has_many :options_#{type}"
  #     define_method("options_#{type}") do
  #       "#{type.to_s.classify}".constantize.respond_to?("roots") ? "#{type.to_s.classify}".constantize.roots : "#{type.to_s.classify}".constantize.all
  #       # "#{type.to_s.classify}".constantize.roots
  #     end
  #   end
  # end

  def url
    polymorphic_url object
  end

  # ["region"].each do |type|
  #   class_eval "has_many :options_#{type}"
  #   define_method("options_#{type}") do
  #     "#{type.classify}".constantize.roots
  #   end
  # end



end
