class Category < ApplicationRecord
	acts_as_nested_set

  def form_node
    children.first ? (children.first.options || children.first.unit ? true : false) : nil
  end

  # def name
  #   leaf? ? self[:name] * 2 : self[:name]
  # end

  def value
    if task = Task.current
      if inspection = Inspection.find_by_category_id_and_task_id(self.id, task.id)
        if options.present?
          options.split('|')[inspection.value.to_i]
        else
          result = inspection.value
          (result == result.to_i ? result.to_i : result).to_s
        end
      else
      end
    end
  end

  def raw_value
    if task = Task.current
      if inspection = Inspection.find_by_category_id_and_task_id(self.id, task.id)
        inspection.value
      else
      end
    end
  end
end
