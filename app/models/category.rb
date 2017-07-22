class Category < ApplicationRecord
	acts_as_nested_set

  def form_node
    children.first ? (children.first.options ? true : false) : nil
  end

end
