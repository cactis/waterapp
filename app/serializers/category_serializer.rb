class CategorySerializer < BaseSerializer
  # include Rails.application.routes.url_helpers
  cache only: [:active]
  attributes :id, :name, :level, :family, :options, :unit

  # attribute :url#, if: :has_children?
  attribute :children_url, if: :has_children?

  def family
    object.self_and_ancestors.map{|obj| FamilySerializer.new obj}
  end

  def has_children?
    object.children.present?
  end

  # def url
  #   eval "#{resource}_url object"
  # end

  def children_url
    eval("#{resource}_url(object)") + "/#{resource.pluralize}/"
  end

  def resource
    object.class.name.underscore
  end

end


class FamilySerializer < BaseSerializer
  attributes :id, :name
end
