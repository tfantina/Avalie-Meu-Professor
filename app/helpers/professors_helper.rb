module ProfessorsHelper

  def sortable(column, title=nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}
  end


  def sort_subject(subject)
    subject = sort_class || "all"
    collection_select(:professor, :id, Review.where(professor_id:
                      @professor.id).select('distinct(whatclass)'),
                      :id, :whatclass, {include_blank: "Select a class"},
                      {onchange: "getClass();" })
  end


end
